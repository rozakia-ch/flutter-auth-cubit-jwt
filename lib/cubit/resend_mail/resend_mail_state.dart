part of 'resend_mail_cubit.dart';

abstract class ResendMailState extends Equatable {
  const ResendMailState();
}

class ResendMailInitial extends ResendMailState {
  @override
  List<Object> get props => [];
}

class ResendMailLoading extends ResendMailState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ResendMailFailed extends ResendMailState {
  String message;
  ResendMailFailed({required this.message});
  @override
  List<Object> get props => [message];
}

// ignore: must_be_immutable
class ResendMailSuccess extends ResendMailState {
  String message;
  ResendMailSuccess({required this.message});
  @override
  List<Object> get props => [message];
}
