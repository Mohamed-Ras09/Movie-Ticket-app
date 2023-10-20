import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticketapp/pages/moviedetails.dart';
import 'package:ticketapp/utils/colors.dart';
import 'package:ticketapp/utils/widgets.dart';

import '../models/modeljson.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    readJson();
    super.initState();
  }

  List items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await jsonDecode(response);
    setState(() {
      items = data;
    });
  }

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
              Container(
                color: scaffoldColor,
                child: CarouselSlider(
                  options: CarouselOptions(
                      //   enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 5.7 / 6,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 2000),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal),
                  items: movies
                      .take(5)
                      .map((item) => Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      item["Poster"],
                                      fit: BoxFit.cover,
                                      width: 400,
                                      height: 300,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        item["Title"],
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: secondaryColor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            item["imdbRating"],
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff3D3D3D),
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "All Movies",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff3D3D3D)),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  reverse: true,
                  itemBuilder: (ctxt, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetails(
                                    details: items[index],
                                  )),
                        );
                        //    Get.toNamed("/details", arguments: {"detail": items[index]});
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25)),
                          //    height: 120,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),

                          child: Column(
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.network(
                                      items[index]["Poster"],
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 10),
                                        Text(
                                          items[index]["Title"],
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
                                              style: TextStyle(
                                                  fontSize: 12, color: lRed),
                                            ),
                                            Flexible(
                                              child: Text(
                                                "  ${items[index]["Genre"]}",
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
                                              style: TextStyle(
                                                  fontSize: 12, color: lRed),
                                            ),
                                            Flexible(
                                              child: Text(
                                                "  ${items[index]["Director"]}",
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
                                              style: TextStyle(
                                                  fontSize: 12, color: lRed),
                                            ),
                                            Flexible(
                                              child: Text(
                                                "  ${items[index]["imdbRating"]}",
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
                  })
            ],
          ),
        ),
      ),
    );
  }
}
