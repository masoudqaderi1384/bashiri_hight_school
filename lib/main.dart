import 'dart:async';

import 'package:bashiri_hight_school/constants.dart';
import 'package:bashiri_hight_school/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:bashiri_hight_school/routes.dart';

void main() => runApp(SplashScreenApp());

class SplashScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          primaryColor: kPrimaryColor,
          ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
