part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class LoginFailed extends LoginState {
  String? email;
  String? password;
  String? message;
  LoginFailed({this.email, this.password, this.message});
  @override
  List<Object?> get props => [email, password, message];
}

// ignore: must_be_immutable
class LoginEmailNotVerified extends LoginState {
  AuthResponse? authResponse;
  LoginEmailNotVerified({this.authResponse});
  @override
  List<Object?> get props => [authResponse];
}
