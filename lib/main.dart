import 'package:flutter/material.dart';
import 'package:ticketapp/firebase_options.dart';
import 'package:ticketapp/pages/bookshow.dart';
import 'package:ticketapp/pages/detailscreen.dart';
import 'package:ticketapp/pages/homescreen.dart';
import 'package:ticketapp/pages/launchscreen.dart';
import 'package:ticketapp/pages/loginscreen.dart';
import 'package:ticketapp/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
