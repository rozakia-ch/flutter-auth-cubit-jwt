import 'package:auth_app/ui/themes/styles.dart' as style;
import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({Key? key, required this.iconPath, required this.onTap}) : super(key: key);
  final String iconPath;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: style.primaryLightColor,
          ),
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          iconPath,
          height: 20.0,
          width: 20.0,
        ),
      ),
    );
  }
}
