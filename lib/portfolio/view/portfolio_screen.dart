import 'package:flutter/material.dart';
import 'package:projeto_criptos/portfolio/widgets/body_portfolio_screen.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: BodyPortfolioScreen(),
      ),
    );
  }
}
