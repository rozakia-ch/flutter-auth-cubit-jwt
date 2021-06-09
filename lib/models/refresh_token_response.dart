import 'package:auth_app/models/token.dart';

class RefreshTokenResponse {
  bool? success;
  String? message;
  Data? data;

  RefreshTokenResponse({this.success, this.message, this.data});

  RefreshTokenResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  Token? token;
  Data({this.token});
  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
  }
}
