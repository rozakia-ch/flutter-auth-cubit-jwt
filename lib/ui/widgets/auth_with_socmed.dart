import 'package:auth_app/cubit/auth/auth_cubit.dart';
import 'package:auth_app/ui/widgets/social_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthWithSocmed extends StatelessWidget {
  const AuthWithSocmed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthData)
          Navigator.pushNamedAndRemoveUntil(
            context,
            "/home-page",
            (Route<dynamic> route) => false,
          );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SocialIcon(
            iconPath: "assets/icons/facebook.png",
            onTap: () => Navigator.pushNamed(context, "/facebook"),
          ),
          SocialIcon(
            iconPath: "assets/icons/twitter.png",
            onTap: () => Navigator.pushNamed(context, "/twitter"),
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return SocialIcon(
                iconPath: "assets/icons/google-plus.png",
                onTap: () => BlocProvider.of<AuthCubit>(context).loginWithGoogle(),
              );
            },
          ),
        ],
      ),
    );
  }
}
