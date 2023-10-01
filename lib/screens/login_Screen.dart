import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'components/My_TextFilled.dart';
import 'components/My_botton.dart';
import 'components/square_title.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // pop the loading circle
      Navigator.pop(context as BuildContext);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context as BuildContext);
      // WRONG EMAIL
      if (e.code == 'user-not-found') {
        // show error to user
        wrongEmailMessage();
      }

      // WRONG PASSWORD
      else if (e.code == 'wrong-password') {
        // show error to user
        wrongPasswordMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'Incorrect Email',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  // wrong password message popup
  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'Incorrect Password',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                Image.asset('assets/images/Logo.png', height: 75,color: Color(0xff990000),),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  '!دوباره خوش آمدید. شما خارج شده بودید',
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'نام کاربری',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'رمز عبور',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'رمز عبور را فراموش کرده اید؟',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  bottomName: 'ورود',
                  onTap: signUserIn,
                ),

                const SizedBox(height: 50),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color(0xff990000),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'یا ادامه دهید با',
                          style: TextStyle(color: Colors.grey[900]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color(0xff990000),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // google button
                    SquareTile(imagePath: 'assets/images/google.png'),

                    SizedBox(width: 25),

                    // apple button
                    SquareTile(imagePath: 'assets/images/apple.png')
                  ],
                ),

                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'ثبت نام کنید',
                        style: TextStyle(color: Color(0xff990000)),
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'اگر عضو نیستید؟',
                      style: TextStyle(
                        color: Color(0x6f212121),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}