import 'package:auth_app/constants/api_constants.dart';
import 'package:auth_app/models/auth_response.dart';
import 'package:auth_app/models/forgot_password_response.dart';
import 'package:auth_app/models/logout_response.dart';
import 'package:auth_app/models/profile_response.dart';
import 'package:auth_app/models/refresh_token_response.dart';
import 'package:auth_app/models/resend_mail_response.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  late Response response;
  var dio = Dio();

  Future loginRepository(String? email, String? password) async {
    var dio = Dio(ApiConstants.DIO_OPTIONS);
    try {
      var _formData = FormData.fromMap({
        'email': email,
        'password': password,
      });
      Response response = await dio.post('/auth/login', data: _formData);
      if (response.data['success'])
        return AuthResponse.fromJson(response.data);
      else
        return AuthResponse.withError(response.data);
    } on DioError catch (ex) {
      print(ex.message);
    }
  }

  Future userProfileRepository(String jwtToken) async {
    var dio = Dio(ApiConstants.DIO_OPTIONS.copyWith(headers: ApiConstants.setHeaders(jwtToken)));
    try {
      Response response = await dio.get('/auth/profile');
      return ProfileResponse.fromJson(response.data);
    } on DioError catch (ex) {
      print(ex.message);
    }
  }

  Future refreshTokenRepository(String jwtToken) async {
    var dio = Dio(ApiConstants.DIO_OPTIONS.copyWith(headers: ApiConstants.setHeaders(jwtToken)));
    try {
      Response response = await dio.get('/auth/refresh-token');
      return RefreshTokenResponse.fromJson(response.data);
    } on DioError catch (ex) {
      print(ex.message);
    }
  }

  Future getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("jwt_token");
  }

  Future saveToken(String jwtToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("jwt_token", jwtToken);
  }

  Future removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("jwt_token");
  }

  Future getloginWithSocmed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("is_socmed");
  }

  Future loginWithSocmed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("is_socmed", true);
  }

  Future updateLoginWithSocmed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("is_socmed", false);
  }

  Future loginWithGoogleRepository(String email, String name) async {
    var dio = Dio(ApiConstants.DIO_OPTIONS);
    try {
      var _formData = FormData.fromMap({
        'name': name,
        'email': email,
      });
      Response response = await dio.post('/auth/login-with-google', data: _formData);
      if (response.data['success'])
        return AuthResponse.fromJson(response.data);
      else
        return AuthResponse.withError(response.data);
    } on DioError catch (ex) {
      print(ex.message);
    }
  }

  Future registerRepository(String? name, String? email, String? password, String? confPass) async {
    var dio = Dio(ApiConstants.DIO_OPTIONS);
    try {
      var _formData = FormData.fromMap({
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': confPass,
      });
      Response response = await dio.post('/auth/register', data: _formData);
      if (response.data['success'])
        return AuthResponse.fromJson(response.data);
      else
        return AuthResponse.withError(response.data);
    } on DioError catch (ex) {
      print(ex.message);
    }
  }

  Future logoutRepository(String jwtToken) async {
    var dio = Dio(ApiConstants.DIO_OPTIONS.copyWith(headers: ApiConstants.setHeaders(jwtToken)));
    try {
      Response response = await dio.get('/auth/logout');
      return LogoutResponse.fromJson(response.data);
    } on DioError catch (ex) {
      print(ex.message);
    }
  }

  Future resendMailRepository(String? email) async {
    var dio = Dio(ApiConstants.DIO_OPTIONS);
    try {
      var _formData = FormData.fromMap({
        'email': email,
      });
      Response response = await dio.post('/auth/resend-mail-verification', data: _formData);
      return ResendMailResponse.fromJson(response.data);
    } on DioError catch (ex) {
      print(ex.message);
    }
  }

  Future forgotPasswordRepository(String? email) async {
    var dio = Dio(ApiConstants.DIO_OPTIONS);
    try {
      var _formData = FormData.fromMap({
        'email': email,
      });
      Response response = await dio.post('/auth/forgot-password', data: _formData);
      return ForgotPasswordResponse.fromJson(response.data);
    } on DioError catch (ex) {
      print(ex.message);
    }
  }
}
