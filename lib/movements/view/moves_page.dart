import 'package:flutter/material.dart';

import '../../shared/templates/custom_bottom_nav_bar.dart';
import 'moves_screen.dart';

class MovesPage extends StatelessWidget {
  const MovesPage({
    super.key,
  });
  static const route = '/moves';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MovesScreen(),
      bottomNavigationBar: CustomBottomNavBar(index: 1),
    );
  }
}
