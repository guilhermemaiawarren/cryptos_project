import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/details/controller/x_axis_provider.dart';

class ChangeAxisButton extends StatefulHookConsumerWidget {
  const ChangeAxisButton({Key? key, required this.buttonDays})
      : super(key: key);

  final int buttonDays;
  @override
  ConsumerState<ChangeAxisButton> createState() => _ChangeAxisButtonState();
}

class _ChangeAxisButtonState extends ConsumerState<ChangeAxisButton> {
  @override
  Widget build(BuildContext context) {
    int xDays = ref.watch(xAxisProvider.notifier).state;
    return InkWell(
      onTap: () {
        setState(() {
          xDays = widget.buttonDays;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: xDays == widget.buttonDays
              ? const Color.fromRGBO(238, 240, 247, 1)
              : Colors.transparent,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 10,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: Text(
          '${widget.buttonDays}D',
          style: TextStyle(
            color: Colors.grey.shade800,
            letterSpacing: 0.5,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
