import 'package:flutter/material.dart';

import '../templates/app_assets.dart';

ThemeData themeDataCriptos() {
  return ThemeData(
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 30,
        fontFamily: AppAssets.montSerrat,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        color: Colors.black,
      ),
      headlineMedium: TextStyle(
        fontSize: 25,
        fontFamily: AppAssets.montSerrat,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        fontFamily: AppAssets.montSerrat,
        color: Colors.black,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 5,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
  );
}
