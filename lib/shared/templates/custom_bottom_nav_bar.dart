import 'package:flutter/material.dart';

import '../../movements/view/moves_page.dart';
import '../../portfolio/view/portfolio_page.dart';
import '../../shared/templates/app_assets.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  late PageController controller;
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(
          context,
        PortfolioPage.route,
        );
        break;
      case 1:
        Navigator.pushNamed(
          context,
          MovesPage.route,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: AppAssets.magenta,
      currentIndex: widget.index,
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(AppAssets.wrnIcon),
          ),
          label: 'Portfólio',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(AppAssets.centsIcon),
          ),
          label: 'Movimentações',
        ),
      ],
    );
  }
}
