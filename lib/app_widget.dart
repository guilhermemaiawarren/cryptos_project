import 'package:flutter/material.dart';
import 'package:projeto_criptos/src/presenter/screens/wallet/wallet_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WalletScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
