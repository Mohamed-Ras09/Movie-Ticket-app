import 'package:flutter/material.dart';
import 'package:ticketapp/utils/colors.dart';
import 'package:ticketapp/utils/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        backgroundColor: lRed,
        centerTitle: true,
        title: Text(
          "Movies",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: primaryColor),
        ),
      ),
      drawer: const Drawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Latest Movies",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff3D3D3D)),
              ),
              const SizedBox(height: 10),
              carousel(),
              const SizedBox(height: 20),
              const Text(
                "All Movies",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff3D3D3D)),
              ),
              const SizedBox(height: 10),
              allMovies()
            ],
          ),
        ),
      ),
    );
  }
}
