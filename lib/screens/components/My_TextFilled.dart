import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final MyTextFieldIcon ;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.MyTextFieldIcon
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        textAlign: TextAlign.end,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(

          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff90000)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff990000)),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[600],
            fontFamily: "Afghan"
          ),
          suffixIcon: Icon(MyTextFieldIcon , color: Color(0x5f990000),),
        ),
      ),
    );
  }
}
