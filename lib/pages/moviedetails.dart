import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key, required this.details});
  final Map details;
  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  void initState() {
    print(widget.details);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lRed,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.chevron_left,
              color: primaryColor,
            )),
        title: Text(
          "Movie",
          style: TextStyle(color: primaryColor),
        ),
      ),
    );
  }
}
