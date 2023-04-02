import 'package:flutter/material.dart';
import 'package:ui_hard/constants.dart';
import 'package:ui_hard/models/event.dart';

class EventItem extends StatelessWidget {
  final Event event;
  final Function? checker;
  const EventItem({
    super.key,
    required this.event,
    this.checker,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: event.isCompleted,
          activeColor: altClr,
          onChanged: (value) {
            checker!;
          },
        ),
        const SizedBox(width: 5),
        Text(event.name),
      ],
    );
  }
}
