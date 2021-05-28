import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.backgroundColor,
    required this.title,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final Color backgroundColor;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            // side: BorderSide(color: Colors.red),
          ),
        ),
        onPressed: onPressed,
        child: Text(title, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
