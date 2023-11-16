import 'dart:io';
import 'package:flutter/material.dart';

class SmallScreenBlack extends StatelessWidget {
  const SmallScreenBlack({Key? key, this.onFlip, required this.size}) : super(key: key);
  final VoidCallback? onFlip;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          brightness: Brightness.dark,
          textTheme: TextTheme(
            displaySmall: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
          )),
      child: Scaffold(
        body: Container(
          height: size.height * 0.25,
          width: size.height * 0.25,
          padding: const EdgeInsets.all(24.0),
          decoration: Platform.isWindows
              ? BoxDecoration(
            border: Border.all(color: Colors.red, width: 5),
          )
              : null,
          child: Image.asset('assets/svg/flutter_black.png'),
        ),
      ),
    );
  }
}