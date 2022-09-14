import 'package:flutter/material.dart';

import '../../shared/templates/app_assets.dart';

class CriptosNavigationBar extends StatefulWidget {
  const CriptosNavigationBar({Key? key}) : super(key: key);

  @override
  State<CriptosNavigationBar> createState() => _CriptosNavigationBarState();
}

class _CriptosNavigationBarState extends State<CriptosNavigationBar> {
  int index = 0;
  void changeIndex(int value) {
    index = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: AppAssets.magenta,
      onTap: changeIndex,
      currentIndex: index,
      items: const [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/warren_logo.png'),
          ),
          label: 'Portfólio',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/cents.png'),
          ),
          label: 'Movimentações',
        ),
      ],
    );
  }
}
