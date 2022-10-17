import 'package:flutter/material.dart';

import 'conversion/view/conversion_page.dart';
import 'details/view/details_page.dart';
import 'movements/view/moves_page.dart';
import 'portfolio/view/portfolio_page.dart';
import 'review/review_page.dart';
import 'review/success_conversion_page.dart';
import 'shared/utils/arguments/conversion_arguments.dart';
import 'shared/utils/arguments/details_arguments.dart';
import 'shared/utils/arguments/review_arguments.dart';

class RouteController {
  static Route<dynamic>? generateRoute(settings) {
    switch (settings.name) {
      case PortfolioPage.route:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation1, animation2) {
            return const PortfolioPage();
          },
        );
      case MovesPage.route:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation1, animation2) {
            return const MovesPage();
          },
        );
      case DetailsPage.route:
        final args = settings.arguments as DetailsArguments;
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation1, animation2) {
            return DetailsPage(
              arguments: args,
            );
          },
        );
      case ConversionPage.route:
        final args = settings.arguments as ConversionArguments;
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation1, animation2) {
            return ConversionPage(arguments: args);
          },
        );
      case ReviewPage.route:
        final args = settings.arguments as ReviewArguments;
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation1, animation2) {
            return ReviewPage(
              arguments: args,
            );
          },
        );
      case SucessConversionPage.route:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) {
            return const SucessConversionPage();
          },
        );
      default:
        return null;
    }
  }
}
