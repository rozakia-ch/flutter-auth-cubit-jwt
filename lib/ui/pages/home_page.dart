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
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          Navigator.pushNamedAndRemoveUntil(context, "/login-page", (route) => false);
        },
        builder: (context, state) => Scaffold(
          body: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state is AuthData ? state.userProfile.name! : "Nothing",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0, letterSpacing: 1.5),
                ),
                Text(
                  state is AuthData ? state.userProfile.email! : "Nothing",
                  style: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 1.5),
                ),
                SizedBox(height: 20.0),
                RoundedButton(
                  backgroundColor: state is AuthLoading ? Colors.grey : style.primaryColor,
                  title: state is AuthLoading ? "Processing.." : "LOGOUT",
                  onPressed: state is AuthLoading ? () {} : () => _authCubit.authLogout(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
