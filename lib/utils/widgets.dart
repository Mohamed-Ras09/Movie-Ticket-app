import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticketapp/models/modeljson.dart';
import 'package:ticketapp/utils/colors.dart';

Widget myTextField(TextEditingController controller, IconData icon, String text,
    bool isPasswordType) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    cursorColor: primaryColor,
    style: const TextStyle(color: Colors.grey, fontSize: 16),
    decoration: InputDecoration(
        prefixIcon: Icon(icon, color: lRed),
        hintText: text,
        filled: true,
        fillColor: primaryColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        )),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Widget launchText() {
  return Text(
    "Book My\nShow",
    textAlign: TextAlign.center,
    style: GoogleFonts.satisfy(
        textStyle: TextStyle(fontSize: 34, color: primaryColor)),
  );
}

Widget movieHeading(String data) {
  return Text(data,
      style: TextStyle(fontSize: 14, color: lRed, fontWeight: FontWeight.w400));
}

Widget movieData(String data) {
  return Text(
    data,
    style: const TextStyle(
        fontSize: 12, color: Color(0xff3D3D3D), fontWeight: FontWeight.w500),
  );
}

Widget hButtons(String name, GestureTapCallback press) {
  return InkWell(
    onTap: press,
    child: Container(
      width: 250,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [lRed, dRed],
          )),
      child: Center(
          child: Text(
        name,
        style: TextStyle(
            fontSize: 14, color: primaryColor, fontWeight: FontWeight.w500),
      )),
    ),
  );
}

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({super.key});

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: scaffoldColor,
      child: CarouselSlider(
        options: CarouselOptions(
            //   enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 5 / 4,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 2000),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal),
        items: movies
            .take(5)
            .map((item) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      item["Poster"],
                      fit: BoxFit.cover,
                      width: 400,
                      height: 300,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

Widget allMovies() {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: movies.length,
      reverse: true,
      itemBuilder: (ctxt, index) {
        return InkWell(
          onTap: () {
            // Navigator.pop(context);
            //  Get.toNamed("/moviesdetails");
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25)),
              //    height: 120,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

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
                                        fontSize: 12, color: Color(0xff3D3D3D)),
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
                                        fontSize: 12, color: Color(0xff3D3D3D)),
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
                                        fontSize: 12, color: Color(0xff3D3D3D)),
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



// Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       item["Title"],
//                       style: TextStyle(
//                           fontSize: 16,
//                           color: secondaryColor,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.star,
//                           color: Colors.amber,
//                         ),
//                         const SizedBox(width: 10),
//                         Text(
//                           item["imdbRating"],
//                           style: const TextStyle(
//                               fontSize: 14,
//                               color: Color(0xff3D3D3D),
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ],
//                     )
//                   ],
//                 )