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
  
  void changePage(int value) {
    setState(() {
      _index = value;
    });
  }

  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: _index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: changePage,
        controller: controller,
        children: const [
          PortfolioScreen(),
          MovesScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromRGBO(224, 43, 87, 1),
        onTap: (page) {
          controller.animateToPage(page,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeIn);
        },
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
