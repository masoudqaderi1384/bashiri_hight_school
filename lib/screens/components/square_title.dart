import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0x3f990000)),
        borderRadius: BorderRadius.circular(16),
        color: Color(0x1f990000),
      ),
      child: Image.asset(
        imagePath,
        height: 40,
      ),
    );
  }
}