import 'package:flutter/material.dart';

class VisibilityOffContainer extends StatelessWidget {
  const VisibilityOffContainer({
    Key? key,
    required this.witdh,
    required this.height,
  }) : super(key: key);
  final double witdh;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: witdh,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
