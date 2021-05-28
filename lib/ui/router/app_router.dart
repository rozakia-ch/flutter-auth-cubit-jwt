import 'package:auth_app/ui/pages/login_page.dart';
import 'package:auth_app/ui/pages/register_page.dart';
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
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
