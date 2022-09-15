
import 'package:flutter/material.dart';
import '../../details/view/details_screen.dart';
import '../../pages/view/pages.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/details': (context) => const DetailsScreen(),
  '/': (context) => const Pages(),
};