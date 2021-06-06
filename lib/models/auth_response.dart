import 'package:auth_app/models/token.dart';
import 'package:auth_app/models/user.dart';

class AuthResponse {
  bool? success;
  String? message;
  Data? data;
  ErrorValidation? error;
  AuthResponse({this.success, this.message, this.data, this.error});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  AuthResponse.withError(Map<String, dynamic> json) {
    success = json['success'];
    error = ErrorValidation.fromJson(json['message']);
  }
}

class Data {
  User? user;
  Token? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
  }
}

class ErrorValidation {
  List<String>? name;
  List<String>? email;
  List<String>? password;
  List<String>? passwordConfirmation;
  ErrorValidation({this.name, this.email, this.password, this.passwordConfirmation});
  ErrorValidation.fromJson(Map<String, dynamic> json) {
    name = json.containsKey('name') ? json['name'].cast<String>() : [];
    email = json.containsKey('email') ? json['email'].cast<String>() : [];
    password = json.containsKey('password') ? json['password'].cast<String>() : [];
    passwordConfirmation =
        json.containsKey('password_confirmation') ? json['password_confirmation'].cast<String>() : [];
  }
}
