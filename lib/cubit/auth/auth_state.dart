part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthFailed extends AuthState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class AuthData extends AuthState {
  User userProfile;
  AuthData({required this.userProfile});
  @override
  List<Object> get props => [userProfile];
}
