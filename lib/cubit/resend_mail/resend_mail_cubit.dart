import 'package:auth_app/models/resend_mail_response.dart';
import 'package:auth_app/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'resend_mail_state.dart';

class ResendMailCubit extends Cubit<ResendMailState> {
  ResendMailCubit() : super(ResendMailInitial());
  AuthRepository _authRepo = AuthRepository();
  void resendMail({required String email}) async {
    emit(ResendMailLoading());
    try {
      ResendMailResponse response = await _authRepo.resendMailRepository(email);
      if (response.success!)
        emit(ResendMailSuccess(message: response.message!));
      else
        emit(ResendMailFailed(message: response.message!));
    } catch (e) {
      print(e);
    }
  }
}
