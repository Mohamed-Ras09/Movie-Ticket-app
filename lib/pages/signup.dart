import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ticketapp/firebase_auth/firebase_auth-ervice.dart';
import 'package:ticketapp/utils/colors.dart';
import 'package:ticketapp/utils/widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final FirebaseAuthService _auth = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        backgroundColor: lRed,
        leading: IconButton(
            onPressed: () {
              //  Get.back();
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.chevron_left,
              color: primaryColor,
            )),
        title: Text(
          "Sign Up",
          style: TextStyle(color: primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              myTextField(name, Icons.person_outline, "Enter UserName", false),
              const SizedBox(height: 20),
              myTextField(email, Icons.mail_outline, "Enter Email", false),
              const SizedBox(height: 20),
              myTextField(password, Icons.lock_outline, "Enter Password", true),
              const SizedBox(height: 40),
              Center(
                  child: hButtons("Sign Up", () {
                _signUp();
                
              })),
            ],
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    String username = name.text;
    String emailAddrress = email.text;
    String passwords = password.text;
    if (name.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty) {
      User? user =
          await _auth.signUpWithEmailAndPassword(emailAddrress, passwords);

      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("User is successfully created")));

       Navigator.pop(context);
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
