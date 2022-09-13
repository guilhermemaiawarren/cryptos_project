import 'package:flutter/material.dart';

import '../../moves/view/moves_screen.dart';
import '../../portfolio/view/portfolio_screen.dart';

class CriptoNavigation extends StatefulWidget {
  const CriptoNavigation({Key? key}) : super(key: key);

  @override
  State<CriptoNavigation> createState() => _CriptoNavigationState();
}

class _CriptoNavigationState extends State<CriptoNavigation> {
  int _index = 0;
  void changeIndex(int value) {
    setState(() {
      _index = value;
    });
  }

  final List<Widget> _pages = [
    const PortfolioScreen(),
    const MovesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_index),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromRGBO(224, 43, 87, 1),
        onTap: changeIndex,
        currentIndex: _index,
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
      ),
    );
  }
}
