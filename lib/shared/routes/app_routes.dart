
import 'package:flutter/material.dart';
import 'package:projeto_criptos/details/view/details_screen.dart';
import 'package:projeto_criptos/pages/view/pages.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  DetailsScreen.route: (context) => const DetailsScreen(),
  Pages.route: (context) => const Pages(),
};