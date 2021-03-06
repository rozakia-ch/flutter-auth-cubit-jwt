import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 5.0),
      // padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      // width: _size.width * 0.8,
      // decoration: BoxDecoration(
      //   color: style.primaryLightColor,
      //   borderRadius: BorderRadius.circular(29.0),
      // ),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: _size.width * 0.8,
      child: child,
    );
  }
}
