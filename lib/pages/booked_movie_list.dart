import 'package:flutter/material.dart';
import 'package:ticketapp/database/storemovie_data.dart';
import 'package:ticketapp/models/bookMovie.dart';
import 'package:ticketapp/utils/colors.dart';

class BookedMovieList extends StatefulWidget {
  const BookedMovieList({super.key});

  @override
  State<BookedMovieList> createState() => _BookedMovieListState();
}

class _BookedMovieListState extends State<BookedMovieList> {
  final DatabaseService _databaseService = DatabaseService();
  List<MovieBookModel> viewList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getRecords();
  }

  Future<void> _getRecords() async {
    var res = await _databaseService.breeds();
    setState(() {
      viewList = res;
    });
    print("my list is:$viewList");
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
            "Movie Booked List",
            style: TextStyle(color: primaryColor),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/home");
              },
              child: BottomAppBar(
                color: lRed,
                height: 50,
                child: Center(
                  child: Text(
                    "Go Back",
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
        body: viewList.isNotEmpty
            ? SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: viewList.length,
                    physics: ClampingScrollPhysics(),
                    reverse: true,
                    itemBuilder: (ctxt, index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          color: Colors.blue,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25)),
                         
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.network(
                                  "http://ia.media-imdb.com/images/M/MV5BMTYwOTEwNjAzMl5BMl5BanBnXkFtZTcwODc5MTUwMw@@._V1_SX300.jpg",
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  Text(
                                    "Game OF Thrones",
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
                                          "  ${viewList[index].date}",
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
                                          "  ${viewList[index].price}",
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
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            : const Center(child: CircularProgressIndicator()));
  }
}
