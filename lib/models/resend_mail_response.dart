class ResendMailResponse {
  bool? success;
  String? message;

  ResendMailResponse({this.success, this.message});

  ResendMailResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }
  ResendMailResponse.withError(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }
}
