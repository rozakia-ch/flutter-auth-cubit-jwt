import 'package:auth_app/cubit/register/register_cubit.dart';
import 'package:auth_app/ui/themes/styles.dart' as style;
import 'package:auth_app/ui/widgets/dialog_box.dart';
import 'package:auth_app/ui/widgets/have_an_account_check.dart';
import 'package:auth_app/ui/widgets/media_query_container.dart';
import 'package:auth_app/ui/widgets/or_divider.dart';
import 'package:auth_app/ui/widgets/rounded_button.dart';
import 'package:auth_app/ui/widgets/social_icon.dart';
import 'package:auth_app/ui/widgets/textfield_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthWithSocmed extends StatelessWidget {
  const AuthWithSocmed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
