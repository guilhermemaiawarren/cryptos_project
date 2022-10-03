import 'package:flutter/material.dart';
import 'package:projeto_criptos/portfolio/widgets/portfolio_screen.dart';

import '../../shared/templates/custom_bottom_nav_bar.dart';


class PortfolioPage extends StatelessWidget {
  const PortfolioPage({Key? key}) : super(key: key);
  static const route = '/portfolio';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PortfolioScreen(key: Key('Coluna'),),
      bottomNavigationBar: CustomBottomNavBar(index: 0),
    );
  }
}
