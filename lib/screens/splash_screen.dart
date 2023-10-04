import 'dart:async';

import 'package:bashiri_hight_school/Screens/auth_page.dart';
import 'package:flutter/material.dart';

class Splash_Screen extends StatefulWidget {

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AuthPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff990000),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double imageSize;
            if (constraints.maxWidth >= 1200) {
              imageSize = 200.0; // Adjust the size for desktop devices
            } else if (constraints.maxWidth >= 600) {
              imageSize = 150.0; // Adjust the size for tablet devices
            } else {
              imageSize = 100.0; // Adjust the size for mobile devices
            }
            return Image.asset(
              'assets/images/LogoWhite.png',
              color: Colors.white,
              width: imageSize,
              height: imageSize,
            );
          },
        ),
      ),
    );
  }
}