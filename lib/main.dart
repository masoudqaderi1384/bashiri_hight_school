import 'package:bashiri_hight_school/Screens/auth_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Screens/Splash_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))],title: Text("Splash Screen Example")),
      body: Center(
          child: Text("Welcome to Home Page",
              style: TextStyle(color: Colors.black, fontSize: 30))),
    );
  }
}
