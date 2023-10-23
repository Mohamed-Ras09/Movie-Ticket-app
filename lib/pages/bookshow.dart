import 'package:flutter/material.dart';
import 'package:ticketapp/database/storemovie_data.dart';
import 'package:ticketapp/models/bookMovie.dart';
import 'package:ticketapp/models/model.dart';
import 'package:ticketapp/pages/booked_movie_list.dart';
import '../utils/colors.dart';

class BookMyShow extends StatefulWidget {
  const BookMyShow({super.key, required this.movieName, required this.poster});
  final String movieName;
  final String poster;
  @override
  State<BookMyShow> createState() => _BookMyShowState();
}

class _BookMyShowState extends State<BookMyShow> {
  final selectedDate = ValueNotifier<DateTime>(DateTime.now());
  final selectedTime = ValueNotifier<TimeOfDay?>(null);
  final DatabaseService _databaseService = DatabaseService();
  bool check = false;
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      if (_counter == 10) {
      } else {
        _counter++;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
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
          "Book My Movie",
          style: TextStyle(color: primaryColor),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookedMovieList(),
                  ));
            },
            child: BottomAppBar(
              color: lRed,
              height: 50,
              child: Center(
                child: Text(
                  "View Details",
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
      body: Column(
        children: [
          const SizedBox(height: 30),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Select Date",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 30),
                ValueListenableBuilder<DateTime>(
                  valueListenable: selectedDate,
                  builder: (context, value, _) {
                    return SizedBox(
                      height: 96,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          14,
                          (index) {
                            final date = DateTime.now().add(
                              Duration(days: index),
                            );
                            return InkWell(
                              onTap: () {
                                selectedDate.value = date;
                              },
                              child: DateWidget(
                                date: date,
                                isSelected: value.simpleDate == date.simpleDate,
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                ValueListenableBuilder<TimeOfDay?>(
                  valueListenable: selectedTime,
                  builder: (context, value, _) {
                    return SizedBox(
                      height: 48,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          8,
                          (index) {
                            final time = TimeOfDay(
                              hour: 10 + (index * 2),
                              minute: 0,
                            );
                            return InkWell(
                              onTap: () {
                                selectedTime.value = time;
                              },
                              child: TimeWidget(
                                time: time,
                                isSelected: value == time,
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    FloatingActionButton(
                      onPressed: _decrementCounter,
                      backgroundColor: lRed,
                      child: Icon(
                        Icons.remove,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      '$_counter',
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 15),
                    FloatingActionButton(
                      onPressed: _incrementCounter,
                      backgroundColor: lRed,
                      child: Icon(
                        Icons.add,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Price",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(height: 10),
                          // ValueListenableBuilder<List<String>>(
                          //   valueListenable: selectedSeat,
                          //   builder: (context, value, _) {
                          //     return Text(
                          //       "\$${value.length * 10}",
                          //       style:
                          //           Theme.of(context).textTheme.headlineSmall,
                          //     );
                          //   },
                          // ),
                          Text(
                            (_counter * 120).toString(),
                            style: Theme.of(context).textTheme.headlineSmall,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          if (check == false) {
                            await _databaseService
                                .insertBreed(MovieBookModel(
                              title: widget.movieName,
                              poster: widget.poster,
                              date: '${selectedDate.value.simpleDate} ${selectedTime.value!.hour}:${selectedTime.value!.minute}',
                                  
                              price: (_counter * 120).toString(),
                            ))
                                .then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Sucessfully add to bookList")));
                              print(_databaseService.breed);
                              print(selectedDate.value.toString() +
                                  selectedDate.value.toString());
                              setState(() {
                                check = true;
                              });
                            });
                          } else if (check == true) {
                            await _databaseService
                                .deleteBreed(widget.movieName!);
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Sucessfully remove to list")));
                            setState(() {
                              check = false;
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: lRed,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          padding: const EdgeInsets.all(16),
                          alignment: Alignment.center,
                          child: Text(
                            check == false ? "Book Now" : "CANCEL",
                            style: TextStyle(
                                fontSize: 16,
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    super.key,
    required this.time,
    this.isSelected = false,
  });

  final TimeOfDay time;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
        color: isSelected ? lRed.withOpacity(0.8) : lRed.withOpacity(0.1),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(right: 16),
      alignment: Alignment.center,
      child: Text(
        "${time.hour < 10 ? "0${time.hour}" : "${time.hour}"} : ${time.minute < 10 ? "0${time.minute}" : "${time.minute}"}",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}

class DateWidget extends StatelessWidget {
  const DateWidget({
    super.key,
    required this.date,
    this.isSelected = false,
  });

  final DateTime date;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
        color: isSelected ? lRed.withOpacity(0.8) : lRed.withOpacity(0.1),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            date.monthName,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? lRed : null,
            ),
            padding: const EdgeInsets.all(8),
            child: Text(
              date.day.toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: isSelected ? primaryColor : null),
            ),
          ),
        ],
      ),
    );
  }
}

extension DateTimeExtension on DateTime {
  String get monthName {
    switch (month) {
      case DateTime.january:
        return "Jan";
      case DateTime.february:
        return "Feb";
      case DateTime.march:
        return "Mar";
      case DateTime.april:
        return "Apr";
      case DateTime.may:
        return "May";
      case DateTime.june:
        return "Jun";
      case DateTime.july:
        return "Jul";
      case DateTime.august:
        return "Aug";
      case DateTime.september:
        return "Sep";
      case DateTime.october:
        return "Oct";
      case DateTime.november:
        return "Nov";
      case DateTime.december:
        return "Dec";
      default:
        return "";
    }
  }

  String get simpleDate {
    return "$day/$month/$year";
  }
}
