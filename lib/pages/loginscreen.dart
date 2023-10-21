import 'package:flutter/material.dart';
import 'package:ticketapp/utils/colors.dart';
import 'package:ticketapp/utils/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
            myTextField(email, Icons.person_outline, "Enter UserName", false),
            const SizedBox(height: 20),
            myTextField(password, Icons.lock_outline, "Enter Password", true),
            const SizedBox(height: 50),
            hButtons("Log In", () {
              // Get.offAllNamed("/home");
              Navigator.pushReplacementNamed(
                context,
                "/home",
              );
            }),
            const SizedBox(height: 20),
            signUp(context)
          ],
        ),
      ),
    );
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
            "/signUp",
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
