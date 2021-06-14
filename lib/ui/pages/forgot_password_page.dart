import 'package:auth_app/ui/widgets/dialog_box.dart';
import 'package:auth_app/ui/widgets/media_query_container.dart';
import 'package:auth_app/ui/widgets/rounded_button.dart';
import 'package:auth_app/ui/widgets/textfield_container.dart';
import 'package:flutter/material.dart';
import 'package:auth_app/ui/themes/styles.dart' as style;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth_app/cubit/forgot_password/forgot_password_cubit.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return MediaQueryContainer(
      child: Scaffold(
        body: _Background(
          child: BlocProvider(
            create: (context) => ForgotPasswordCubit(),
            child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
              listener: (context, state) {
                if (state is ForgotPasswordSuccess)
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => DialogBox(
                      title: "Resend Email successfully",
                      descriptions: state.message,
                      text: "Yes",
                    ),
                  );
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Forgot Password", style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 10.0),
                      Image.asset(
                        "assets/icons/login.png",
                        height: _size.height * 0.3,
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
                            errorText: state is ForgotPasswordFailed
                                ? state.message != ""
                                    ? state.message
                                    : null
                                : null,
                          ),
                        ),
                      ),
                      RoundedButton(
                        backgroundColor: state is ForgotPasswordLoading ? Colors.grey : style.primaryColor,
                        title: state is ForgotPasswordLoading ? "Processing" : "Forgot Password",
                        onPressed: state is ForgotPasswordLoading
                            ? () {}
                            : () => BlocProvider.of<ForgotPasswordCubit>(context)
                                .forgotPassword(email: emailController.text),
                      ),
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
