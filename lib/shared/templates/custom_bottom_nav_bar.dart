import 'package:flutter/material.dart';
import 'package:projeto_criptos/shared/routes/app_routes.dart';

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
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                appRoutes['/portfolio']!(context),
          ),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                appRoutes['/moves']!(context),
          ),
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
