import 'package:bashiri_hight_school/screens/login_screen/login_screen.dart';
import 'package:bashiri_hight_school/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes ={
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
};