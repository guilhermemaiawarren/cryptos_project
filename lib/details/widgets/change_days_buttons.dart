import 'package:flutter/material.dart';

import 'change_day_button.dart';

class ChangeDaysButtons extends StatelessWidget {
  const ChangeDaysButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children:  const [
          ChangeDayButton(days: 5),
          ChangeDayButton(days: 15),
          ChangeDayButton(days: 30),
          ChangeDayButton(days: 45),
          ChangeDayButton(days: 90),
          ChangeDayButton(days: 180),
          ChangeDayButton(days: 365),
        ],
      ),
    );
  }
}
