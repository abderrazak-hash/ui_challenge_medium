import 'package:flutter/material.dart';
import 'package:ui_hard/constants.dart';

class SuccessBox extends StatelessWidget {
  const SuccessBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Hero(
        tag: 'dash',
        child: Image.asset(
          'assets/dash.png',
          height: 80.0,
        ),
      ),
      content: const SizedBox(
        height: 40.0,
        child: Center(
          child: Text(
            'You have added it successfully',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      actions: [
        Center(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Container(
              height: 50.0,
              padding: const EdgeInsets.all(8),
              width: 140.0,
              decoration: BoxDecoration(
                color: altClr,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text(
                  'Done',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
