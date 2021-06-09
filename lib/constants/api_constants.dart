import 'package:dio/dio.dart';

class ApiConstants {
  static const String API_URL = "https://api-que.herokuapp.com";
  // static const String API_URL = "http://172.16.17.12:8000";
  static setHeaders(token) => {
        // 'Content-Type': 'application/json',
        // 'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
  // ignore: non_constant_identifier_names
  static BaseOptions DIO_OPTIONS = BaseOptions(
    baseUrl: API_URL,
    connectTimeout: 10000,
    receiveTimeout: 5000,
  );
}
