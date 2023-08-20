import 'dart:async';

import 'package:bashiri_hight_school/screens/login.dart';
import 'package:flutter/material.dart';

class _IniciarAppState extends State<IniciarApp> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 120),
            Image.asset(
              'assets/logotipo/ic_launcher_adaptive_fore.png',
              width: 150,
            ),
            SizedBox(height: 180),
            Text(
              'from',
              style:
                  TextStyle(fontFamily: 'Carmen', color: Colors.grey.shade700),
            ),
            SizedBox(height: 5.5),

            // Logo da entidade externa
            Image.asset('assets/logotipo/logo_entidade.png', width: 25),
            SizedBox(height: 5.5),
            Text(
              'Escola Secundária de Camarate',
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'Carmen',
                fontWeight: FontWeight.bold,
                color: Color(0xff4285F4),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class IniciarApp extends StatefulWidget {
  const IniciarApp({Key? key}) : super(key: key);

  @override
  State<IniciarApp> createState() => _IniciarAppState();
}
