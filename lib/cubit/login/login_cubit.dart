import 'package:auth_app/cubit/auth/auth_cubit.dart';
import 'package:auth_app/models/auth_response.dart';
import 'package:auth_app/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authCubit}) : super(LoginInitial());
  final AuthRepository _authRepo = AuthRepository();
  final AuthCubit authCubit;
  void login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      AuthResponse response = await _authRepo.loginRepository(email, password);

      if (response.success!) {
        if (!response.data!.user!.emailVerified!) {
          emit(LoginEmailNotVerified(authResponse: response));
        } else {
          authCubit.authLogin(jwtToken: response.data!.token!.accessToken!);
          emit(LoginInitial());
        }
      } else {
        var error = response.error!;
        emit(LoginFailed(
          email: error.email!.length > 0 ? error.email!.join(". ") : "",
          password: error.password!.length > 0 ? error.password!.join(". ") : "",
          message: "",
        ));
      }
    } catch (e) {
      emit(LoginFailed(message: e.toString()));
      print(e);
    }
  }
}
