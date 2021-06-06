import 'package:auth_app/cubit/auth/auth_cubit.dart';
import 'package:auth_app/ui/widgets/media_query_container.dart';
import 'package:auth_app/ui/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth_app/ui/themes/styles.dart' as style;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthCubit _authCubit = BlocProvider.of<AuthCubit>(context);
    return MediaQueryContainer(
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          Navigator.pushNamedAndRemoveUntil(context, "/login-page", (route) => false);
        },
        child: Scaffold(
          body: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedButton(
                  backgroundColor: style.primaryColor,
                  title: "LOGOUT",
                  onPressed: () => _authCubit.authLogout(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
