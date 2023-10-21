import 'package:flutter/material.dart';
import 'package:ticketapp/pages/detailscreen.dart';
import 'package:ticketapp/pages/homescreen.dart';
import 'package:ticketapp/pages/launchscreen.dart';
import 'package:ticketapp/pages/loginscreen.dart';
import 'package:ticketapp/pages/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book My Ticket',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: "Roboto"),
      //home: const SplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/signup': (context) => const SignUp(),
        '/detailscreen': (context) => const DetailScreen(),
      },
    );
  }
}
