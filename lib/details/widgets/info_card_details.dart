import 'package:flutter/material.dart';

class InfoCardDetails extends StatelessWidget {
  const InfoCardDetails({
    Key? key,
    required this.label,
    required this.text,
    this.color,
  }) : super(key: key);

  final String label;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 30,
      ),
      child: Column(
        children: [
          const Divider(thickness: 1),
          Row(
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
                  fontSize: 20,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 35),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
