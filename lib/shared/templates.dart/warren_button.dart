import 'package:flutter/material.dart';

class WarrenButton extends StatelessWidget {
  const WarrenButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: MaterialButton(
        color: const Color.fromRGBO(224, 43, 87, 1),
        height: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: onPressed,
        child: const Text(
          'Converter moeda',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
