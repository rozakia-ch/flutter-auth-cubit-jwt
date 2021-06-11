import 'package:auth_app/models/logout_response.dart';
import 'package:auth_app/models/profile_response.dart';
import 'package:auth_app/models/refresh_token_response.dart';
import 'package:auth_app/models/user.dart';
import 'package:auth_app/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()) {
    authCheck();
  }
  AuthRepository _authRepo = AuthRepository();
  void authCheck() async {
    var jwtToken = await _authRepo.getToken();
    if (jwtToken != null) {
      bool hasExpired = JwtDecoder.isExpired(jwtToken);
      if (hasExpired) refreshToken(jwtToken);
      authHasToken();
    } else {
      emit(AuthFailed());
    }
  }

  void refreshToken(String jwtToken) async {
    try {
      RefreshTokenResponse response = await _authRepo.refreshTokenRepository(jwtToken);
      await _authRepo.saveToken(response.data!.token!.accessToken!);
      authHasToken();
    } catch (e) {
      print(e);
    }
  }

  void authLogin({required String jwtToken}) async {
    await _authRepo.saveToken(jwtToken);
    authHasToken();
  }

  void authHasToken() async {
    try {
      String jwtToken = await _authRepo.getToken();
      ProfileResponse response = await _authRepo.userProfileRepository(jwtToken);
      emit(AuthData(userProfile: response.data!.user!));
    } catch (e) {
      print(e);
    }
  }

  void authLogout() async {
    emit(AuthLoading());
    String jwtToken = await _authRepo.getToken();
    try {
      LogoutResponse response = await _authRepo.logoutRepository(jwtToken);
      if (response.success!) {
        await _authRepo.removeToken();
        emit(AuthInitial());
      }
    } catch (e) {
      print(e);
    }
  }
}
