import 'package:bashiri_hight_school/constants.dart';
import 'package:bashiri_hight_school/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = 'splashscreen';
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
    });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset('images/school.png', width: 200),
                  SizedBox(height: 25,),
                  Text('مؤسسه تعلیمی خصوصی', style: TextStyle(
                    color: kTextWitheColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Afghan',
                  ),),
                  Text('حاجی عبدالظاهر بشیری و فرزندان',style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Afghan',
                    color: kTextWitheColor
                  )
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
