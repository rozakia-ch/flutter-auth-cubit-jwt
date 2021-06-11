import 'package:auth_app/cubit/auth/auth_cubit.dart';
import 'package:auth_app/cubit/login/login_cubit.dart';
import 'package:auth_app/ui/themes/styles.dart' as style;
import 'package:auth_app/ui/widgets/have_an_account_check.dart';
import 'package:auth_app/ui/widgets/media_query_container.dart';
import 'package:auth_app/ui/widgets/rounded_button.dart';
import 'package:auth_app/ui/widgets/textfield_container.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  bool _hidePassword = true;
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final AuthCubit _authCubit = BlocProvider.of<AuthCubit>(context);
    return MediaQueryContainer(
      child: Scaffold(
        body: _Background(
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthData)
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/home-page",
                  (Route<dynamic> route) => false,
                );
            },
            child: BlocProvider(
              create: (context) => LoginCubit(authCubit: _authCubit),
              child: BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: _size.height * 0.1),
                        Text("LOGIN", style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: _size.height * 0.05),
                        Image.asset(
                          "assets/icons/login.png",
                          height: _size.height * 0.35,
                        ),
                        if (state is LoginEmailNotVerified)
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            padding: const EdgeInsets.all(15.0),
                            width: _size.width * 0.8,
                            decoration: BoxDecoration(
                              color: style.errorColor,
                              borderRadius: BorderRadius.circular(29.0),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.error,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10.0),
                                Flexible(
                                  child: RichText(
                                    text: TextSpan(
                                      text: "${state.authResponse!.message!}\t",
                                      style: TextStyle(color: Colors.white),
                                      children: [
                                        TextSpan(
                                          text: 'click here to resend',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: style.primaryColor,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap =
                                                () => Navigator.pushNamed(context, "/resend-email-page"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          width: _size.width * 0.8,
                          child: TextField(
                            controller: emailController,
                            cursorColor: style.primaryColor,
                            autofocus: false,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 15.0).copyWith(right: 20.0),
                              fillColor: style.primaryLightColor,
                              filled: true,
                              hintText: "Your Email",
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                                child: Icon(Icons.person, color: style.primaryColor),
                              ),
                              border: style.fieldInputBorder,
                              errorText: state is LoginFailed
                                  ? state.email != ""
                                      ? state.email
                                      : null
                                  : null,
                              errorMaxLines: 5,
                            ),
                          ),
                        ),
                        TextFieldContainer(
                          child: TextField(
                            controller: passController,
                            cursorColor: style.primaryColor,
                            obscureText: _hidePassword,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 15.0).copyWith(right: 20.0),
                              fillColor: style.primaryLightColor,
                              filled: true,
                              hintText: "Password",
                              prefixIcon: Icon(Icons.lock, color: style.primaryColor),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.visibility,
                                  color: _hidePassword ? style.primaryColor : Colors.blue,
                                ),
                                onPressed: () => setState(() {
                                  _hidePassword = !_hidePassword;
                                }),
                              ),
                              border: style.fieldInputBorder,
                              errorText: state is LoginFailed
                                  ? state.password != ""
                                      ? state.password
                                      : null
                                  : null,
                            ),
                          ),
                        ),
                        RoundedButton(
                          backgroundColor: state is LoginLoading ? Colors.grey : style.primaryColor,
                          title: state is LoginLoading ? "Processing" : "LOGIN",
                          onPressed: state is LoginLoading
                              ? () {}
                              : () {
                                  BlocProvider.of<LoginCubit>(context).login(
                                    email: emailController.text,
                                    password: passController.text,
                                  );
                                },
                        ),
                        TextButton(
                          onPressed: () => Navigator.pushNamed(context, "/forgot-password-page"),
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(color: style.primaryColor),
                          ),
                        ),
                        SizedBox(height: _size.height * 0.05),
                        HaveAnAccountCheck(
                          onTap: () => Navigator.pushNamed(context, "/register-page"),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  );
                },
              ),
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
              width: _size.width * 0.35,
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: Image.asset(
              "assets/images/login_bottom.png",
              width: _size.width * 0.4,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
