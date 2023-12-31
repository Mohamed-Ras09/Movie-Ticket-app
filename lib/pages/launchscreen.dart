import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ticketapp/pages/homescreen.dart';
import 'package:ticketapp/pages/loginscreen.dart';
import 'package:ticketapp/utils/colors.dart';
import '../utils/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      goToPage();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [lRed, dRed])),
        child: Center(
          child: launchText(),
        ),
      ),
    );
  }

  void goToPage() {
    // Get.offAllNamed('/login');
    FirebaseAuth.instance.authStateChanges();
    final checkUser = FirebaseAuth.instance.currentUser;
    print("My user detail is:${checkUser}");
    if (checkUser != null) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }
}
