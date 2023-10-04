import 'package:bashiri_hight_school/Screens/components/Forgot_Password.dart';
import 'package:bashiri_hight_school/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'components/My_TextFilled.dart';
import 'components/My_botton.dart';
import 'components/square_title.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign user in method
  void signUserUp() async {
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
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        wrongPasswordMessage();
      }
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
                Image.asset(
                  'assets/images/Logo.png',
                  height: 50,
                  color: Color(0xff990000),
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  '!خوش آمدید. حساب کاربری خود را بسازید',
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  MyTextFieldIcon: Icons.alternate_email_rounded,
                  controller: emailController,
                  hintText: 'ایمیل',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  MyTextFieldIcon: Icons.password_rounded,
                  controller: passwordController,
                  hintText: 'رمز عبور',
                  obscureText: true,
                ),

                const SizedBox(height: 10),
                MyTextField(
                  MyTextFieldIcon: Icons.password_rounded,
                  controller: confirmPasswordController,
                  hintText: 'تکرار رمز عبور',
                  obscureText: true,
                ),

                //const SizedBox(height: 10),

                // forgot password?
                //ForgotPassword(),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  bottomName: 'ثبت نام',
                  onTap: signUserUp,
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
                  children: [
                    // google button
                    SquareTile(
                        onTap: () => AuthServices().signWithGoogle(),
                        imagePath: 'assets/images/google.png'),

                    SizedBox(width: 25),

                    // apple button
                    SquareTile(
                        onTap: () {}, imagePath: 'assets/images/apple.png')
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
                        'وارد شوید',
                        style: TextStyle(color: Color(0xff990000)),
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'اگر عضو هستید؟',
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
