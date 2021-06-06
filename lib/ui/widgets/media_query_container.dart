import 'package:flutter/material.dart';

class MediaQueryContainer extends StatelessWidget {
  const MediaQueryContainer({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.5),
      ),
      child: child,
    );
  }
}
