import 'package:flutter/material.dart';
import 'package:ui_hard/screens/account_screen.dart';
import 'package:ui_hard/screens/add_event_screen.dart';
import 'package:ui_hard/constants.dart';
import 'package:ui_hard/repository/events_repo.dart';
import 'package:ui_hard/widgets/event_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateTime selectedDate;
  List<String> days = [
    'Monday',
    'Thuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          highlightElevation: 0,
          heroTag: null,
          hoverElevation: 0,
          focusElevation: 0,
          disabledElevation: 0,
          backgroundColor: Colors.transparent,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddEventScreen(
                  action: (event) {
                    setState(() {
                      EventsRepo.addEvent(event);
                    });
                  },
                ),
              ),
            );
          },
          child: Hero(
            tag: 'add',
            child: Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                color: altClr,
                border: Border.all(
                  width: 1.0,
                  color: altClr,
                ),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 10,
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AccountScreen(),
                        ),
                      );
                    },
                    child: const Hero(
                      tag: 'avatar',
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundImage: AssetImage(
                          'assets/avatar.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'March ${selectedDate.year},',
                style: const TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: altClr,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${selectedDate.day} ${days[selectedDate.weekday - 1].substring(0, 3)}',
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: altClr,
                    ),
                  ),
                  Hero(
                    tag: 'dash',
                    child: Image.asset(
                      'assets/dash.png',
                      height: 50,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: double.infinity,
                child: Divider(
                  thickness: 3,
                  color: altClr,
                ),
              ),
              CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                onDateChanged: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Events',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: altClr,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Divider(
                      color: altClr,
                      thickness: 3,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: ListView(
                    children: List.generate(
                      EventsRepo.events.length,
                      (index) => EventItem(
                        event: EventsRepo.events[index],
                        checker: () {
                          setState(() {
                            EventsRepo.completeEvent(index);
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: const [
                  Text(
                    'Bootcamps',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: altClr,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Divider(
                      color: altClr,
                      thickness: 3,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: ListView(
                    children: List.generate(
                      EventsRepo.bootcamps.length,
                      (index) => EventItem(
                        event: EventsRepo.bootcamps[index],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
