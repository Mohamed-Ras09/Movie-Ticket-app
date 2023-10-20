import 'package:flutter/material.dart';
import 'package:ticketapp/pages/homescreen.dart';
import 'package:ticketapp/pages/launchscreen.dart';
import 'package:get/get.dart';
import 'package:ticketapp/pages/moviedetail.dart';
import 'package:ticketapp/pages/signup.dart';
import 'pages/loginscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Book My Ticket',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: "Roboto"),
      home: SplashScreen(),
      getPages: [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(name: "/login", page: () => const LoginScreen()),
        GetPage(name: "/signUp", page: () => const SignUp()),
        GetPage(name: "/home", page: () => const HomeScreen()),
        GetPage(name: "/detail", page: () => const MovieDetails()),
      ],
    );
  }
}
