import 'package:flutter/material.dart';
import 'package:projeto_criptos/portfolio/model/crypto_view_data.dart';

import 'details/view/details_screen.dart';
import 'moves/view/moves_screen.dart';
import 'portfolio/view/portfolio_screen.dart';

class RouteController {
  static Route<dynamic>? generateRoute(settings) {
    if (settings.name == PortfolioScreen.route) {
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation1, animation2) {
          return const PortfolioScreen();
        },
      );
    } else if (settings.name == MovesScreen.route) {
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation1, animation2) {
          return const MovesScreen();
        },
      );
    } else if (settings.name == DetailsScreen.route) {
      final args = settings.arguments as CryptoViewData;
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation1, animation2) {
          return DetailsScreen(
            asset: args,
          );
        },
      );
    }
    return null;
  }
}
