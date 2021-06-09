import 'package:auth_app/models/user.dart';

class ProfileResponse {
  bool? success;
  String? message;
  Data? data;
  ProfileResponse({this.success, this.message, this.data});
  ProfileResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  User? user;
  Data({this.user});
  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }
}
