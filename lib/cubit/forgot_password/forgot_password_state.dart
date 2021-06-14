part of 'forgot_password_cubit.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();
}

class ForgotPasswordInitial extends ForgotPasswordState {
  @override
  List<Object> get props => [];
}

class ForgotPasswordLoading extends ForgotPasswordState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ForgotPasswordFailed extends ForgotPasswordState {
  String message;
  ForgotPasswordFailed({required this.message});
  @override
  List<Object> get props => [message];
}

// ignore: must_be_immutable
class ForgotPasswordSuccess extends ForgotPasswordState {
  String message;
  ForgotPasswordSuccess({required this.message});
  @override
  List<Object> get props => [message];
}
