import 'package:auth_app/models/auth_response.dart';
import 'package:auth_app/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  AuthRepository _authRepo = AuthRepository();
  void register({
    required String name,
    required String email,
    required String password,
    required String confPass,
  }) async {
    emit(RegisterLoading());
    try {
      AuthResponse response = await _authRepo.registerRepository(name, email, password, confPass);
      if (response.success!) {
        emit(RegisterSuccess(authResponse: response));
      } else {
        var error = response.error!;
        emit(RegisterFailed(
          name: error.name!.length > 0 ? error.name!.join(".") : "",
          email: error.email!.length > 0 ? error.email!.join(".") : "",
          password: error.password!.length > 0 ? error.password!.join(".") : "",
          confPass: error.passwordConfirmation!.length > 0 ? error.passwordConfirmation!.join(".") : "",
        ));
      }
    } catch (e) {
      print(e);
    }
  }
}
