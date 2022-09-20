import 'package:flutter/material.dart';

import '../../shared/templates/custom_bottom_nav_bar.dart';
import '../widgets/body_portfolio_screen.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({Key? key}) : super(key: key);
  static const route = '/portfolio';
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: BodyPortfolioScreen(),
        bottomNavigationBar: CustomBottomNavBar(index: 0),
      ),
    );
  }
}
