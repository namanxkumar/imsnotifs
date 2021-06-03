import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testproj/pages/sessions-postpage.dart';
import 'package:testproj/widgets/homelistitem.dart';
import 'package:page_transition/page_transition.dart';

class SessionsScreen extends StatefulWidget {
  @override
  _SessionsScreenState createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  final List<Map> tiles = [
    {
      "title": "Valorant",
      "group": "Rudimentary Gaming",
      "button": 0,
      "start": "11:35",
      "end": "13:05",
      "color": 0xffDA8E70,
    },
    {
      "title": "CSGO",
      "group": "NASA Gang",
      "button": 1,
      "start": "12:30",
      "end": "14:00",
      "color": 0xffC1D4B6,
    },
    {
      "title": "Among Us",
      "group": "YeRt",
      "button": 2,
      "start": "15:10",
      "end": "16:40",
      "color": 0xffFBDEAC,
    },
    {
      "title": "Valorant",
      "group": "Procrastination 100",
      "button": 1,
      "start": "20:00",
      "end": "21:00",
      "color": 0xffF4B6B0,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 28, right: 28),
        child: Column(
          children: [
            CustomAppBar(),
            Stack(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 57,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryVariant,
                        // border: Border.all(
                        //   width: 2,
                        //   color: Color(0xffEEEEEE),
                        // ),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ],
              ),
              Container(
                height: 57.0,
                child: CalendarList(),
              ),
            ]),
            SizedBox(
              height: 15,
            ),
            HomeCalendar(tiles)
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  // final onTodayPress;
  // CustomAppBar(this.onTodayPress);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sessions",
                style: Theme.of(context).textTheme.headline1,
              ),
              GreenButton(), //ontodaypress
            ],
          )
        ],
      ),
    );
  }
}

class GreenButton extends StatelessWidget {
  // final onTodayPress;
  // GreenButton(this.onTodayPress);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Theme.of(context).colorScheme.primaryVariant,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
              // primary: Theme.of(context).colorScheme.primary,
              textStyle: Theme.of(context).textTheme.button,
            ),
            child: Text('Today'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class CalendarList extends StatefulWidget {
  // CalendarList({Key? key, this.onToday: false}) : super(key: key);
  // bool onToday;
  @override
  _CalendarListState createState() => _CalendarListState();
}

class _CalendarListState extends State<CalendarList> {
  final List<int> days = [23, 24, 25, 26, 27, 28, 29, 30, 31];
  final List<String> daynames = ["M", "T", "W", "T", "F", "S", "S"];
  final int first = 1;
  var selIndex = 0;

  String getDay(int day) {
    int d = day - days[0];
    d = d + first;
    if (d > 6) {
      d = d % 6;
    }
    return daynames[d];
  }

  FixedExtentScrollController fixedExtentScrollController =
      new FixedExtentScrollController();

  // void jumpToIndex(onToday) {
  //   if (fixedExtentScrollController.hasClients && onToday == true) {
  //     fixedExtentScrollController.jumpTo(0.0);
  //     widget.onToday = false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // jumpToIndex(widget.onToday);
    return RotatedBox(
      quarterTurns: 3,
      child: ListWheelScrollView(
        controller: fixedExtentScrollController,
        perspective: 0.000001,
        physics: FixedExtentScrollPhysics(),
        itemExtent: 50,
        onSelectedItemChanged: (index) {
          setState(() {
            selIndex = index;
          });
        },
        children: days
            .map((day) => Container(
                  //height: 100,
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          getDay(day),
                          style: GoogleFonts.poppins(
                            color: selIndex == days.indexOf(day)
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.onBackground,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          day.toString(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: selIndex == days.indexOf(day)
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.onBackground,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class HomeCalendar extends StatefulWidget {
  HomeCalendar(this.data);
  final data;
  @override
  _HomeCalendarState createState() => _HomeCalendarState();
}

class _HomeCalendarState extends State<HomeCalendar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: widget.data.length,
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: SessionDetailPage(data: widget.data[index]),
                    type: PageTransitionType.rightToLeft,
                    duration: Duration(milliseconds: 200),
                    reverseDuration: Duration(milliseconds: 200),
                  ),
                );
              },
              child: ListItem(
                widget.data[index]["title"],
                widget.data[index]["group"],
                widget.data[index]["button"],
                widget.data[index]["start"],
                widget.data[index]["end"],
                widget.data[index]["color"],
              ),
            );
          },
        ),
      ),
    );
  }
}
