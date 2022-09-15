import 'package:flutter/material.dart';

import 'details/view/details_screen.dart';
import 'moves/view/moves_screen.dart';
import 'portfolio/view/portfolio_screen.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  PortfolioScreen.route: (context) => const PortfolioScreen(),
  MovesScreen.route: (context) => const MovesScreen(),
  DetailsScreen.route: (context) => const DetailsScreen(),
};
