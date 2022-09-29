import 'package:flutter/material.dart';

class InfoRowDetails extends StatelessWidget {
  const InfoRowDetails({
    Key? key,
    required this.label,
    required this.text,
    this.color,
    this.fontWeight,
  }) : super(key: key);

  final String label;
  final String text;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 11,
      ),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color.fromRGBO(117, 118, 128, 1),
              fontSize: 20,
            ),
          ),
          const Spacer(),
          Text(
            text,
            style: TextStyle(
              color: color ?? const Color.fromRGBO(47, 47, 51, 1),
              fontWeight: fontWeight ?? FontWeight.w400,
              fontSize: 18,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
