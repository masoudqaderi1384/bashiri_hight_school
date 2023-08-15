import 'package:bashiri_hight_school/constants.dart';
import 'package:flutter/material.dart';
class MyTextFeild extends StatelessWidget {
  final controller;
  final String hintText;
  final  bool obscureText;

  const MyTextFeild({super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText
  }
  );

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(

        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor)
          ),
          fillColor: kOtherColor,

          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: kTextBlackColor,fontFamily: 'Com', )
        ),
      ),
    );
  }
}
