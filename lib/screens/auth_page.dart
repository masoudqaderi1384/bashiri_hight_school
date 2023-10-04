 import 'package:bashiri_hight_school/Screens/HomePage.dart';
import 'package:bashiri_hight_school/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'LoginOrRegisterPage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return HomePage();
          }

          // user is NOT logged in
          else {
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
// https://docs.google.com/spreadsheets/d/1E28_9oUDbU3dxxAhmY5Bnf9xNAE9DjbkN7o90sda3co/edit#gid=0