import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/utils/widgets.dart';
import '../models/controllers/homecontroller.dart';
import '../utils/colors.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeController dController = Get.put((HomeController()));

  @override
  void dispose() {
    dController.selectedMovie.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        backgroundColor: lRed,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      dController.selectedMovie[0]["Poster"],
                      height: 250,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  dController.selectedMovie[0]["Title"],
                  style: TextStyle(
                      fontSize: 26,
                      color: secondaryColor,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  dController.selectedMovie[0]["Genre"],
                  style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xff3D3D3D),
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                movieHeading("Plot :"),
                movieData(dController.selectedMovie[0]["Plot"]),
                const SizedBox(height: 10),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: dController.selectedMovie[0]["Images"].length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 5),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: primaryColor),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              dController.selectedMovie[0]["Images"][index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(height: 10),
                movieHeading("Actors :"),
                movieData(dController.selectedMovie[0]["Actors"]),
                const SizedBox(height: 10),
                movieHeading("Runtime :"),
                movieData(dController.selectedMovie[0]["Runtime"]),
                const SizedBox(height: 10),
                movieHeading("Language :"),
                movieData(dController.selectedMovie[0]["Language"]),
                const SizedBox(height: 10),
                movieHeading("Director :"),
                movieData(dController.selectedMovie[0]["Director"]),
                const SizedBox(height: 10),
                movieHeading("Writer :"),
                movieData(dController.selectedMovie[0]["Writer"]),
                const SizedBox(height: 10),
                movieHeading("Year :"),
                movieData(dController.selectedMovie[0]["Year"]),
                const SizedBox(height: 10),
                movieHeading("Released :"),
                movieData(dController.selectedMovie[0]["Released"]),
                const SizedBox(height: 10),
                movieHeading("Awards :"),
                movieData(dController.selectedMovie[0]["Awards"]),
                const SizedBox(height: 10),
                movieHeading("Country :"),
                movieData(dController.selectedMovie[0]["Country"]),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: GestureDetector(
            onTap: () {},
            child: BottomAppBar(
              color: lRed,
              height: 50,
              child: Center(
                child: Text(
                  "Book Now",
                  style: TextStyle(
                      fontSize: 18,
                      color: primaryColor,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
