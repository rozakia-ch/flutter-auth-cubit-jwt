import 'package:auth_app/constants/color_constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HaveAnAccountCheck extends StatelessWidget {
  const HaveAnAccountCheck({
    Key? key,
    this.isLoginPage = true,
    required this.onTap,
  }) : super(key: key);
  final bool isLoginPage;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: isLoginPage ? "Don't have an Account? " : "Already have an Account? ",
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(
            text: isLoginPage ? "Register" : "Login",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorConstant.primaryColor,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
