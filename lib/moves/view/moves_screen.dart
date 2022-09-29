import 'package:flutter/material.dart';

import '../../shared/templates/custom_bottom_nav_bar.dart';
import '../widgets/body_moves.dart';

class MovesScreen extends StatelessWidget {
  const MovesScreen({Key? key}) : super(key: key);
  static const route = '/moves';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyMoves(),
      bottomNavigationBar: CustomBottomNavBar(index: 1),
    );
  }
}
