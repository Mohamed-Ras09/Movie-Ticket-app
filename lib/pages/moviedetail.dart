import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({
    super.key,
    //  required this.details
  });

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  // final Map details;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.chevron_left,
              color: primaryColor,
            )),
        backgroundColor: lRed,
        centerTitle: true,
        title: Text(
          "",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: primaryColor),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
        ],
      ),
    );
  }
}





// class MovieDetail extends StatefulWidget {
//   const MovieDetail({
//     super.key,
//     required this.details,
//   });
//   final Map details;
//   @override
//   State<MovieDetail> createState() => _MovieDetailState();
// }

// class _MovieDetailState extends State<MovieDetail> {
//   @override
//   Widget build(BuildContext context) {
//     // print();
    // return Scaffold(
    //   appBar: AppBar(
    //     leading: IconButton(
    //         onPressed: () {
    //           Get.back();
    //         },
    //         icon: Icon(
    //           Icons.chevron_left,
    //           color: primaryColor,
    //         )),
    //     backgroundColor: lRed,
    //     centerTitle: true,
    //     title: Text(
    //       "",
    //       style: TextStyle(
    //           fontSize: 18, fontWeight: FontWeight.w500, color: primaryColor),
    //     ),
    //   ),
    //   body: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       SizedBox(height: 20),
    //       Image.network(widget.details["Poster"])
    //     ],
    //   ),
    // );
//   }
// }
