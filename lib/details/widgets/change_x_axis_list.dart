import 'package:flutter/material.dart';
import 'change_axis_button.dart';

class ChangeXAxisButtons extends StatelessWidget {
  const ChangeXAxisButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          ChangeAxisButton(buttonDays: 1),
          ChangeAxisButton(buttonDays: 7),
          ChangeAxisButton(buttonDays: 14),
          ChangeAxisButton(buttonDays: 30),
          ChangeAxisButton(buttonDays: 90),
          ChangeAxisButton(buttonDays: 180),
          ChangeAxisButton(buttonDays: 365),
        ],
      ),
    );
  }
}
