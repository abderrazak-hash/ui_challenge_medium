import 'package:flutter/material.dart';
import 'package:ui_hard/constants.dart';
import 'package:ui_hard/screens/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: altClr,
      ),
      home: const EventApp(),
    ),
  );
}

class EventApp extends StatelessWidget {
  const EventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
