import 'package:flutter/material.dart';
import 'change_axis_button.dart';

class ChangeXAxisButtons extends StatelessWidget {
  const ChangeXAxisButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Row(
        children: const [
          ChangeAxisButton(buttonDays: 5),
          ChangeAxisButton(buttonDays: 15),
          ChangeAxisButton(buttonDays: 30),
          ChangeAxisButton(buttonDays: 45),
          ChangeAxisButton(buttonDays: 90),
        ],
      ),
    );
  }
}
