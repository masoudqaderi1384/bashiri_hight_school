import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'Pages.dart';

class HomePage extends StatelessWidget {
  final _controllar = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 600,
            child: PageView(
              controller: _controllar,
              children: const [
                Page1(),
                Page2(),
                Page3(),
              ],
            ),
          ),
          SmoothPageIndicator(controller: _controllar, count: 3, effect: SwapEffect(
            activeDotColor: Colors.blue.shade800,
            dotColor: Colors.blue.shade400,
            dotHeight: 30,
            dotWidth: 30,
            spacing: 16,
            type: SwapType.yRotation,
            paintStyle: PaintingStyle.fill

          ),)
        ],
      ),
    );
  }
}
