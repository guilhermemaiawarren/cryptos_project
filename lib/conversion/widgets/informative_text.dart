import 'package:flutter/material.dart';

import '../../shared/templates/app_assets.dart';

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
        style: TextStyle(
          fontSize: 25,
          fontFamily: AppAssets.montSerrat,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}