import 'package:flutter/material.dart';

import 'app_assets.dart';

class WarrenButton extends StatelessWidget {
  const WarrenButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.color,
    this.textColor,
    this.borderSide,
  }) : super(key: key);
  final void Function()? onPressed;
  final String text;
  final Color? color;
  final Color? textColor;
  final BorderSide? borderSide;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color ?? AppAssets.magenta,
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: borderSide == null ? BorderSide.none : borderSide!,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: 17,
        ),
      ),
    );
  }
}
