// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ticketapp/firebase_auth/firebase_auth-ervice.dart';
import 'package:ticketapp/utils/colors.dart';
import 'package:ticketapp/utils/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController emailControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: secondaryColor,
            image: const DecorationImage(
                image: AssetImage("images/background.jpeg"),
                fit: BoxFit.cover,
                opacity: 0.3)),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            launchText(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.20),
            myTextField(
                emailControl, Icons.person_outline, "Enter UserName", false),
            const SizedBox(height: 20),
            myTextField(
                passwordControl, Icons.lock_outline, "Enter Password", true),
            const SizedBox(height: 50),
            hButtons("Log In", () {
              _signIn();
            }),
            const SizedBox(height: 20),
            signUp(context)
          ],
        ),
      ),
    );
  }

  void _signIn() async {
    String email = emailControl.text;
    String password = passwordControl.text;
    if (emailControl.text.isNotEmpty && passwordControl.text.isNotEmpty) {
      User? user = await _auth.signInWithEmailAndPassword(email, password);

      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("User is successfully created")));
        Navigator.pushNamed(context, "/home");
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Some error happend")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please fill all details"),
      ));
    }
  }
}

Row signUp(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Don't have account ?",
        style: TextStyle(color: primaryColor),
      ),
      GestureDetector(
        onTap: () {
          //   Get.toNamed("/signUp");
          Navigator.pushNamed(
            context,
            "/signup",
          );
        },
        child: Text(
          " Sign Up",
          style: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: Colors.red,
              color: lRed,
              fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}
