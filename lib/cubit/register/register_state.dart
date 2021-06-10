part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class RegisterFailed extends RegisterState {
  String? name;
  String? email;
  String? password;
  String? confPass;
  RegisterFailed({this.name, this.email, this.password, this.confPass});
  @override
  List<Object?> get props => [name, email, password, confPass];
}

// ignore: must_be_immutable
class RegisterSuccess extends RegisterState {
  AuthResponse? authResponse;
  RegisterSuccess({this.authResponse});
  @override
  List<Object?> get props => [authResponse];
}
