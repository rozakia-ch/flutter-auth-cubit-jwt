class LogoutResponse {
  bool? success;
  String? message;

  LogoutResponse({this.success, this.message});

  LogoutResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }
}
