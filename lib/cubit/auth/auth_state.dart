part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthFailed extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthData extends AuthState {
  @override
  List<Object> get props => [];
}
