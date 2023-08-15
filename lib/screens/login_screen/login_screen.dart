import 'package:bashiri_hight_school/componants.dart';
import 'package:bashiri_hight_school/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = 'LoginScreen';
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOtherColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50,),
              Image.asset('images/school.png', height: 100,),
              SizedBox(height: 50,),
              MyTextFeild(controller: usernameController, hintText: 'Username', obscureText: false),
              SizedBox(height: 10,),
              MyTextFeild(controller: passwordController, hintText: 'Password', obscureText: true),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Text('رمز را فرموش کرده ام؟', style: TextStyle(fontFamily: 'Afghan'),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
