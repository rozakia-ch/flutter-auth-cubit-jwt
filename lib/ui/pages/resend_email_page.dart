import 'package:auth_app/cubit/resend_mail/resend_mail_cubit.dart';
import 'package:auth_app/ui/widgets/dialog_box.dart';
import 'package:auth_app/ui/widgets/media_query_container.dart';
import 'package:auth_app/ui/widgets/rounded_button.dart';
import 'package:auth_app/ui/widgets/textfield_container.dart';
import 'package:flutter/material.dart';
import 'package:auth_app/ui/themes/styles.dart' as style;
import 'package:flutter_bloc/flutter_bloc.dart';

class ResendEmailPage extends StatefulWidget {
  const ResendEmailPage({Key? key}) : super(key: key);

  @override
  _ResendEmailPageState createState() => _ResendEmailPageState();
}

class _ResendEmailPageState extends State<ResendEmailPage> {
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
            create: (context) => ResendMailCubit(),
            child: BlocConsumer<ResendMailCubit, ResendMailState>(
              listener: (context, state) {
                if (state is ResendMailSuccess)
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
                      Text("Resend email Verification", style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 10.0),
                      Image.asset(
                        "assets/icons/signup.png",
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
                            errorText: state is ResendMailFailed
                                ? state.message != ""
                                    ? state.message
                                    : null
                                : null,
                          ),
                        ),
                      ),
                      RoundedButton(
                        backgroundColor: state is ResendMailLoading ? Colors.grey : style.primaryColor,
                        title: state is ResendMailLoading ? "Processing" : "Submit",
                        onPressed: state is ResendMailLoading
                            ? () {}
                            : () => BlocProvider.of<ResendMailCubit>(context).resendMail(
                                  email: emailController.text,
                                ),
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
