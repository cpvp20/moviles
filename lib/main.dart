import 'package:estructura_practica_1/colors.dart';
import 'package:estructura_practica_1/splash.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData base = ThemeData.light();
    return MaterialApp(
      title: APP_TITLE,
      home: SplashPage(),
    );
  }
}
