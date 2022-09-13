
import 'package:flutter/material.dart';
import 'package:projeto_criptos/cripto_navigation/view/cripto_navigation.dart';
import 'package:projeto_criptos/details/view/details_screen.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  DetailsScreen.route: (context) => const DetailsScreen(),
  CriptoNavigation.route: (context) => const CriptoNavigation(),
};