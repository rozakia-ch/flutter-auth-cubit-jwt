import 'package:auth_app/ui/pages/forgot_password_page.dart';
import 'package:auth_app/ui/pages/home_page.dart';
import 'package:auth_app/ui/pages/login_page.dart';
import 'package:auth_app/ui/pages/register_page.dart';
import 'package:auth_app/ui/pages/resend_email_page.dart';
import 'package:auth_app/ui/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => WelcomePage());
      case '/login-page':
        return MaterialPageRoute(builder: (context) => LoginPage());
      case '/register-page':
        return MaterialPageRoute(builder: (context) => RegisterPage());
      case '/resend-email-page':
        return MaterialPageRoute(builder: (context) => ResendEmailPage());
      case '/forgot-password-page':
        return MaterialPageRoute(builder: (context) => ForgotPasswordPage());
      case '/home-page':
        return MaterialPageRoute(builder: (context) => HomePage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
