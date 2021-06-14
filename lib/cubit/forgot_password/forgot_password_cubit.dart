import 'package:auth_app/models/forgot_password_response.dart';
import 'package:auth_app/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());
  AuthRepository _authRepo = AuthRepository();
  void forgotPassword({required String email}) async {
    emit(ForgotPasswordLoading());
    try {
      ForgotPasswordResponse response = await _authRepo.forgotPasswordRepository(email);
      if (response.success!)
        emit(ForgotPasswordSuccess(message: response.message!));
      else
        emit(ForgotPasswordFailed(message: response.message!));
    } catch (e) {
      print(e);
    }
  }
}
