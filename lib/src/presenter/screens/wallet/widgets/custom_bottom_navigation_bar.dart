import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int index = 0;
  void changeIndex(int value) {
    index = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.pink,
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
