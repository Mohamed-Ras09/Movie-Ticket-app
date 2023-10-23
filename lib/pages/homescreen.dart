// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/models/controllers/homecontroller.dart';
// import 'package:flutter/services.dart';
import 'package:ticketapp/utils/colors.dart';
import 'package:ticketapp/utils/widgets.dart';

import '../models/modeljson.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // @override
  // void initState() {
  //   // readJson();
  //   super.initState();
  // }

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
            children: const [
              Text(
                "Latest Movies",
                // ignore: prefer_const_constructors
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff3D3D3D)),
              ),
              SizedBox(height: 10),
              HomeCarousel(),
              SizedBox(height: 20),
              Text(
                "All Movies",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff3D3D3D)),
              ),
              SizedBox(height: 10),
              AllMovies()
            ],
          ),
        ),
      ),
    );
  }

  // List items = [];

  // Future<void> readJson() async {
  //   final String response = await rootBundle.loadString('assets/sample.json');
  //   final data = await jsonDecode(response);
  //   setState(() {
  //     items = data;
  //   });
  // }
}

class AllMovies extends StatelessWidget {
  const AllMovies({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController hController = Get.put((HomeController()));
    return ListView.builder(
        shrinkWrap: true,
        itemCount: movies.length,
        reverse: true,
        itemBuilder: (ctxt, index) {
          return InkWell(
            onTap: () {
              hController.selectedMovie.add(movies[index]);
              //Get.toNamed("/moviesdetails");
              Navigator.pushNamed(context, "/detailscreen");
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25)),
                //    height: 120,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                child: Column(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.network(
                            movies[index]["Poster"],
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                movies[index]["Title"],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff3D3D3D)),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Genre : ",
                                    style: TextStyle(fontSize: 12, color: lRed),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "  ${movies[index]["Genre"]}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff3D3D3D)),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Director : ",
                                    style: TextStyle(fontSize: 12, color: lRed),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "  ${movies[index]["Director"]}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff3D3D3D)),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "imdbRating : ",
                                    style: TextStyle(fontSize: 12, color: lRed),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "  ${movies[index]["imdbRating"]}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff3D3D3D)),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
