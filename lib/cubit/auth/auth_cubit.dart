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
      if (hasExpired) _refreshToken(jwtToken);
      emit(AuthData());
    } else {
      emit(AuthFailed());
    }
  }

  void _refreshToken(String jwtToken) async {
    try {
      // AuthResponse response = await _authRepo.refreshTokenRepository(jwtToken);
      emit(AuthData());
    } catch (e) {
      print(e);
    }
  }

  void authHasToken({required String jwtToken}) async {
    await _authRepo.saveToken(jwtToken);
    emit(AuthData());
  }

  void authLogout() async {
    await _authRepo.removeToken();
    emit(AuthInitial());
  }
}
