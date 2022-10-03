import 'package:flutter/material.dart';

import '../../moves/view/moves_screen.dart';
import '../../shared/templates/custom_bottom_nav_bar.dart';

class MovesPage extends StatelessWidget {
  const MovesPage({
    Key? key,
  }) : super(key: key);
  static const route = '/moves';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MovesScreen(),
      bottomNavigationBar: CustomBottomNavBar(index: 1),
    );
  }
}
