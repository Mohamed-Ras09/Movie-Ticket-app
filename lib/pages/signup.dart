import 'package:flutter/material.dart';
import 'package:ticketapp/utils/colors.dart';
import 'package:ticketapp/utils/widgets.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
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
                //  Get.back();
                Navigator.pop(context);
              })),
            ],
          ),
        ),
      ),
    );
  }
}
