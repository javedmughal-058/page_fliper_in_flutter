import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_fliper_in_flutter/utils/app_assets.dart';
import 'package:page_fliper_in_flutter/utils/helper.dart';

class DarkHomePage extends StatelessWidget {
  const DarkHomePage({Key? key, this.onFlip}) : super(key: key);
  final VoidCallback? onFlip;

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
          padding: const EdgeInsets.all(24.0),
          decoration: Platform.isWindows
              ? BoxDecoration(
            border: Border.all(color: Colors.red, width: 5),
          )
              : null,
          child: Column(
            children: [
              const ProfileHeader(prompt: 'Good night,\nsleep tight!'),
              const Spacer(),
              // SvgPicture.asset(
              //   AppAssets.flutterBlack,
              //   semanticsLabel: 'Flutter Black',
              //   // width: 300,
              //   // height: 300,
              // ),
              Image.asset('assets/svg/flutter_black.png'),
              const Spacer(),
              BottomFlipIconButton(onFlip: onFlip),
            ],
          ),
        ),
      ),
    );
  }
}