import 'package:flutter/material.dart';
import 'package:projeto_criptos/details/view/details_page.dart';
import 'package:projeto_criptos/portfolio/view/portfolio_page.dart';
import 'package:projeto_criptos/review/success_conversion_page.dart';
import 'package:projeto_criptos/review/review_page.dart';
import 'package:projeto_criptos/shared/common_model/move_model.dart';
import 'package:projeto_criptos/shared/utils/arguments/to_revision_arguments.dart';
import 'conversion/view/conversion_page.dart';
import 'movements/view/moves_page.dart';
import 'shared/utils/arguments/to_conversion_arguments.dart';
import 'shared/utils/arguments/to_details_arguments.dart';

class RouteController {
  static Route<dynamic>? generateRoute(settings) {
    if (settings.name == PortfolioPage.route) {
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation1, animation2) {
          return const PortfolioPage();
        },
      );
    } else if (settings.name == MovesPage.route) {
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation1, animation2) {
          return const MovesPage();
        },
      );
    } else if (settings.name == DetailsPage.route) {
      final args = settings.arguments as ToDetailsArguments;
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation1, animation2) {
          return DetailsPage(
            asset: args.crypto,
            coinAmmount: args.coinAmmount,
          );
        },
      );
    } else if (settings.name == ConversionPage.route) {
      final args = settings.arguments as ToConversionArguments;
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation1, animation2) {
          return ConversionPage(
            coinAmmount: args.cryptoAmmount,
            asset: args.crypto,
          );
        },
      );
    } else if (settings.name == RevisionPage.route) {
      final args = settings.arguments as ToRevisionArguments;
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation1, animation2) {
          return RevisionPage(
            convert: args.convert,
            recieve: args.recieve,
            convertCoin: args.convertCoin,
            recieveCoin: args.recieveCoin,
          );
        },
      );
    } else if (settings.name == SucessConversionPage.route) {
      final args = settings.arguments as MoveModel;
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) {
          return SucessConversionPage(move: args);
        },
      );
    }
    return null;
  }
}
