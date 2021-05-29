import 'package:auth_app/constants/color_constants.dart';
import 'package:auth_app/ui/widgets/have_an_account_check.dart';
import 'package:auth_app/ui/widgets/rounded_button.dart';
import 'package:auth_app/ui/widgets/social_icon.dart';
import 'package:auth_app/ui/widgets/textfield_container.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.5),
      ),
      child: Scaffold(
        body: _Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("REGISTER", style: TextStyle(fontWeight: FontWeight.bold)),
                // SizedBox(height: _size.height * 0.05),
                Image.asset(
                  "assets/icons/signup.png",
                  height: _size.height * 0.3,
                ),
                TextFieldContainer(
                  child: TextField(
                    cursorColor: ColorConstant.primaryColor,
                    decoration: InputDecoration(
                      hintText: "Your Email",
                      prefixIcon: Icon(Icons.person, color: ColorConstant.primaryColor),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextFieldContainer(
                  child: TextField(
                    cursorColor: ColorConstant.primaryColor,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock, color: ColorConstant.primaryColor),
                      suffixIcon: Icon(Icons.visibility, color: ColorConstant.primaryColor),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                RoundedButton(
                  backgroundColor: ColorConstant.primaryColor,
                  title: "Register",
                  onPressed: () {},
                ),
                SizedBox(height: _size.height * 0.05),
                HaveAnAccountCheck(
                  isLoginPage: false,
                  onTap: () => Navigator.pushNamed(context, "/login-page"),
                ),
                _OrDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialIcon(
                      iconPath: "assets/icons/facebook.png",
                      onTap: () {},
                    ),
                    SocialIcon(
                      iconPath: "assets/icons/twitter.png",
                      onTap: () {},
                    ),
                    SocialIcon(
                      iconPath: "assets/icons/google-plus.png",
                      onTap: () {},
                    ),
                  ],
                )
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
              "assets/images/signup_top.png",
              width: _size.width * 0.35,
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            child: Image.asset(
              "assets/images/main_bottom.png",
              width: _size.width * 0.25,
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class _OrDivider extends StatelessWidget {
  const _OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: _size.height * 0.02),
      width: _size.width * 0.8,
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Color(0xFFD9D9D9),
              height: 1.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "OR",
              style: TextStyle(
                color: ColorConstant.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Color(0xFFD9D9D9),
              height: 1.5,
            ),
          )
        ],
      ),
    );
  }
}
