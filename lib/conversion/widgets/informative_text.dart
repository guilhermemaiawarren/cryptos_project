import 'package:flutter/material.dart';


class InformativeText extends StatelessWidget {

  const InformativeText({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 30,
      ),
      child: Text(
        'Quanto você gostaria de converter?',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}