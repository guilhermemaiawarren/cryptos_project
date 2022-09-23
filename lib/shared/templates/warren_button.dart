import 'package:flutter/material.dart';


class WarrenButton extends StatelessWidget {
  const WarrenButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.color,
  }) : super(key: key);
  final void Function()? onPressed;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: MaterialButton(
        color: color,
        height: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
