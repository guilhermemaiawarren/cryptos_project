import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int index = 1;
  void changeIndex(int value) {
    index = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.grey,
      onTap: changeIndex,
      currentIndex: index,
      items: const [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/warren_logo.png'),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.image),
          label: 'Carteiras',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.currency_bitcoin),
          label: 'Movimentações',
        ),
      ],
    );
  }
}
