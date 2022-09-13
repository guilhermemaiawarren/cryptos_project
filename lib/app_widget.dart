import 'package:flutter/material.dart';
import 'package:projeto_criptos/cripto_navigation/view/cripto_navigation.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CriptoNavigation(),
      debugShowCheckedModeBanner: false,
    );
  }
}
