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
    return InkWell(
      onTap: () {
        setState(() {
          ref.read(xAxisProvider.state).state = widget.buttonDays;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ref.watch(xAxisProvider.state).state == widget.buttonDays
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