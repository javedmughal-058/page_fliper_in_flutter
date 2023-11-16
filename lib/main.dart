import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:page_flip_builder/page_flip_builder.dart';
import 'package:page_fliper_in_flutter/view/dark_page.dart';
import 'package:page_fliper_in_flutter/view/light_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final pageFlipKey = GlobalKey<PageFlipBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: PageFlipBuilder(
        key: pageFlipKey,
        frontBuilder: (_) => LightHomePage(
          onFlip: () => pageFlipKey.currentState?.flip(),
        ),
        backBuilder: (_) => DarkHomePage(
          onFlip: () => pageFlipKey.currentState?.flip(),
        ),
        flipAxis: Axis.horizontal,
        maxTilt: 0.003,
        maxScale: 0.2,
        onFlipComplete: (isFrontSide) => log('Side: ${isFrontSide ? "FrontSide" : "BackSide"}'),
      ),
    );
  }
}


