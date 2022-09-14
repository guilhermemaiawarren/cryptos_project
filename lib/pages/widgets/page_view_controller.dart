import 'package:flutter/material.dart';

import '../../moves/view/moves_screen.dart';
import '../../portfolio/view/portfolio_screen.dart';

class PageViewController extends StatefulWidget {
  PageViewController({
    Key? key,
    required this.onPageChanged,
    required this.controller,
  }) : super(key: key);
  void Function(int)? onPageChanged;
  final PageController controller;
  @override
  State<PageViewController> createState() => _PageViewControllerState();
}

class _PageViewControllerState extends State<PageViewController> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: widget.onPageChanged,
      controller: widget.controller,
      children: const [
        PortfolioScreen(),
        MovesScreen(),
      ],
    );
  }
}
