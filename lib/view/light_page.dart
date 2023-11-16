import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_flip_builder/page_flip_builder.dart';
import 'package:page_fliper_in_flutter/utils/app_assets.dart';
import 'package:page_fliper_in_flutter/utils/helper.dart';
import 'package:page_fliper_in_flutter/view/small_screen_black.dart';
import 'package:page_fliper_in_flutter/view/small_screen_white.dart';

class LightHomePage extends StatelessWidget {
  LightHomePage({Key? key, this.onFlip}) : super(key: key);
  final VoidCallback? onFlip;

  final pageFlipKey2 = GlobalKey<PageFlipBuilderState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Theme(
      data: ThemeData(
          brightness: Brightness.light,
          textTheme: TextTheme(
            displaySmall: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: Colors.black87, fontWeight: FontWeight.w600),
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
              const ProfileHeader(prompt: 'Hello,\nFlutter Developer!'),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                height: size.height *0.35,
                child: PageFlipBuilder(
                  key: pageFlipKey2,
                  frontBuilder: (_) => SmallScreenWhite(
                    onFlip: () => pageFlipKey2.currentState?.flip(),
                    size: size,
                  ),
                  backBuilder: (_) => SmallScreenBlack(
                    onFlip: () => pageFlipKey2.currentState?.flip(),
                    size: size,
                  ),
                  flipAxis: Axis.horizontal,
                  maxTilt: 0.003,
                  maxScale: 0.2,
                  onFlipComplete: (isFrontSide) => log('Small: ${isFrontSide ? "FrontSide" : "BackSide"}'),
                ),
              ),
              // SvgPicture.asset(
              //   AppAssets.flutterLight,
              //   semanticsLabel: 'Flutter Light',
              //   // width: 300,
              //   // height: 300,
              // ),
              Image.asset('assets/svg/flutter_white.png'),
              BottomFlipIconButton(onFlip: onFlip),
            ],
          ),
        ),
      ),
    );
  }
}