import 'package:auth_app/cubit/register/register_cubit.dart';
import 'package:auth_app/ui/themes/styles.dart' as style;
import 'package:auth_app/ui/widgets/dialog_box.dart';
import 'package:auth_app/ui/widgets/have_an_account_check.dart';
import 'package:auth_app/ui/widgets/media_query_container.dart';
import 'package:auth_app/ui/widgets/rounded_button.dart';
import 'package:auth_app/ui/widgets/social_icon.dart';
import 'package:auth_app/ui/widgets/textfield_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confPassController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    confPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return MediaQueryContainer(
      child: Scaffold(
        body: _Background(
          child: BlocProvider(
            create: (context) => RegisterCubit(),
            child: BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state is RegisterSuccess)
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => DialogBox(
                      title: "Register successfully",
                      descriptions: state.authResponse!.message,
                      text: "Yes",
                    ),
                  );
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: _size.height * 0.1),
                      Text("REGISTER", style: TextStyle(fontWeight: FontWeight.bold)),
                      Image.asset(
                        "assets/icons/signup.png",
                        height: _size.height * 0.3,
                      ),
                      TextFieldContainer(
                        child: TextField(
                          controller: nameController,
                          cursorColor: style.primaryColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 15.0).copyWith(right: 20.0),
                            fillColor: style.primaryLightColor,
                            filled: true,
                            hintText: "Your Name",
                            prefixIcon: Icon(Icons.person, color: style.primaryColor),
                            border: style.fieldInputBorder,
                            errorText: state is RegisterFailed
                                ? state.name != ""
                                    ? state.name
                                    : null
                                : null,
                          ),
                        ),
                      ),
                      TextFieldContainer(
                        child: TextField(
                          controller: emailController,
                          cursorColor: style.primaryColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 15.0).copyWith(right: 20.0),
                            fillColor: style.primaryLightColor,
                            filled: true,
                            hintText: "Your Email",
                            prefixIcon: Icon(Icons.person, color: style.primaryColor),
                            border: style.fieldInputBorder,
                            errorText: state is RegisterFailed
                                ? state.email != ""
                                    ? state.email
                                    : null
                                : null,
                          ),
                        ),
                      ),
                      TextFieldContainer(
                        child: TextField(
                          controller: passController,
                          cursorColor: style.primaryColor,
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 15.0).copyWith(right: 20.0),
                            fillColor: style.primaryLightColor,
                            filled: true,
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock, color: style.primaryColor),
                            // suffixIcon: Icon(Icons.visibility, color: style.primaryColor),
                            border: style.fieldInputBorder,
                            errorText: state is RegisterFailed
                                ? state.password != ""
                                    ? state.password
                                    : null
                                : null,
                          ),
                        ),
                      ),
                      TextFieldContainer(
                        child: TextField(
                          controller: confPassController,
                          cursorColor: style.primaryColor,
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 15.0).copyWith(right: 20.0),
                            fillColor: style.primaryLightColor,
                            filled: true,
                            hintText: "Confirmation Password",
                            prefixIcon: Icon(Icons.lock, color: style.primaryColor),
                            // suffixIcon: Icon(Icons.visibility, color: style.primaryColor),
                            border: style.fieldInputBorder,
                            errorText: state is RegisterFailed
                                ? state.confPass != ""
                                    ? state.confPass
                                    : null
                                : null,
                          ),
                        ),
                      ),
                      RoundedButton(
                        backgroundColor: state is RegisterLoading ? Colors.grey : style.primaryColor,
                        title: state is RegisterLoading ? "Processing" : "Register",
                        onPressed: state is RegisterLoading
                            ? () {}
                            : () => BlocProvider.of<RegisterCubit>(context).register(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passController.text,
                                  confPass: confPassController.text,
                                ),
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
                      ),
                      SizedBox(height: _size.height * 0.03),
                    ],
                  ),
                );
              },
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
                color: style.primaryColor,
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
