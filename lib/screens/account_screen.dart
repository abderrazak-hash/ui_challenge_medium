import 'package:flutter/material.dart';
import 'package:ui_hard/constants.dart';
import 'package:ui_hard/repository/events_repo.dart';
import 'package:ui_hard/widgets/event_item.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 230,
              child: Stack(
                children: [
                  Container(
                    height: 180.0,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [mainClr, altClr],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(20),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20.0,
                    left: 20.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40.0,
                        padding: const EdgeInsets.only(left: 8),
                        width: 40.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 135.0,
                    left: MediaQuery.of(context).size.width / 2 - 45,
                    child: Container(
                      height: 90.0,
                      padding: const EdgeInsets.all(8),
                      width: 90.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Hero(
                        tag: 'avatar',
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/avatar.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Center(
              child: Text(
                'AbdErrazak KENNICHE',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0, top: 25, bottom: 10.0),
              child: Text(
                'Events Complete',
                style: TextStyle(
                  fontSize: 20.0,
                  color: altClr,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: ListView(
                  children: List.generate(
                    EventsRepo.completedEvents.length,
                    (index) => EventItem(
                      event: EventsRepo.completedEvents[index],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
