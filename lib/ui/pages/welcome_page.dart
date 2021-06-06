import 'package:auth_app/ui/themes/styles.dart' as style;
import 'package:auth_app/ui/widgets/media_query_container.dart';
import 'package:auth_app/ui/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return MediaQueryContainer(
      child: Scaffold(
        body: _Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: _size.height * 0.05),
                Image.asset("assets/icons/chat.png", height: _size.height * 0.5),
                SizedBox(height: _size.height * 0.05),
                RoundedButton(
                  title: "Login",
                  backgroundColor: style.primaryColor,
                  onPressed: () => Navigator.pushNamed(context, "/login-page"),
                ),
                RoundedButton(
                  title: "Register",
                  backgroundColor: style.primaryLightColor,
                  onPressed: () => Navigator.pushNamed(context, "/register-page"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
      height: _size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            child: Image.asset(
              "assets/images/main_top.png",
              width: _size.width * 0.3,
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            child: Image.asset(
              "assets/images/main_bottom.png",
              width: _size.width * 0.3,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
