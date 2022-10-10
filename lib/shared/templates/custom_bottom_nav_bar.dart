import 'package:flutter/material.dart';
import '../../l10n/core_strings.dart';
import '../../portfolio/view/portfolio_page.dart';

import '../../movements/view/moves_page.dart';
import '../../shared/templates/app_assets.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key, required this.index});
  final int index;
  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
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
          label: CoreStrings.of(context)!.portfolio,
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(AppAssets.centsIcon),
          ),
          label: CoreStrings.of(context)!.moves,
        ),
      ],
    );
  }
}
