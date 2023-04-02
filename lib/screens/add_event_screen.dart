import 'package:flutter/material.dart';
import 'package:ui_hard/screens/account_screen.dart';
import 'package:ui_hard/constants.dart';
import 'package:ui_hard/models/event.dart';
import 'package:ui_hard/widgets/success_box.dart';

class AddEventScreen extends StatelessWidget {
  final Function action;

  const AddEventScreen({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
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
                          color: altClr,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: altClr,
                        ),
                      ),
                    ),
                  ),
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
              const SizedBox(height: 20),
              const Text(
                'Event name',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  hintText: '',
                  filled: true,
                  fillColor: Color.fromARGB(255, 235, 235, 237),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: altClr,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                ),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 20),
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const TextField(
                decoration: InputDecoration(
                  hintText: '',
                  filled: true,
                  fillColor: Color.fromARGB(255, 235, 235, 237),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: altClr,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Time range',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'From:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 55.0,
                        width: 150.0,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '',
                            filled: true,
                            fillColor: const Color.fromARGB(255, 235, 235, 237),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: altClr,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                );
                              },
                              child: const Icon(
                                Icons.calendar_month,
                                color: altClr,
                              ),
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'To:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 55.0,
                        width: 150.0,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '',
                            filled: true,
                            fillColor: const Color.fromARGB(255, 235, 235, 237),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: altClr,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                );
                              },
                              child: const Icon(
                                Icons.calendar_month,
                                color: altClr,
                              ),
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: Hero(
                  tag: 'add',
                  child: TextButton(
                    onPressed: () {
                      Event event =
                          Event(name: textEditingController.value.text);
                      action(event);
                      showDialog(
                        barrierDismissible: false,
                        barrierColor: Colors.transparent,
                        context: context,
                        builder: (context) => const SuccessBox(),
                      );

                      // Navigator.pop(context);
                    },
                    child: Container(
                      height: 50.0,
                      padding: const EdgeInsets.all(8),
                      width: 140.0,
                      decoration: BoxDecoration(
                        color: altClr,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Add event',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
