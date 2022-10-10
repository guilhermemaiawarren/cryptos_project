import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/days_provider.dart';

class ChangeDayButton extends HookConsumerWidget {
  const ChangeDayButton({
    super.key,
    required this.days,
  });

  final int days;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var graphDays = ref.watch(daysProvider.state).state;

    return GestureDetector(
      key: const Key('GestureDetectorChangeDayButton'),
      onTap: () {
        ref.read(daysProvider.state).state = days;
      },
      child: Container(
        key: const Key('ContainerChangeDaysButton'),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: graphDays == days
              ? const Color.fromRGBO(238, 240, 247, 1)
              : Colors.transparent,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Text(
          '${days}D',
          key: const Key('TextChangeDaysButton'),
          style: TextStyle(
            color: graphDays == days ? Colors.black : Colors.grey.shade500,
            letterSpacing: 0.5,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
