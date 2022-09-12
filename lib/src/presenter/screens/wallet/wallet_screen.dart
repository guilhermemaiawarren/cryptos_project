import 'package:flutter/material.dart';
import 'package:projeto_criptos/src/presenter/screens/wallet/widgets/body_wallet_screen.dart';
import 'package:projeto_criptos/src/presenter/screens/wallet/widgets/criptos_navigation_bar.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          body: BodyWalletScreen(),
          bottomNavigationBar: CriptosNavigationBar()),
    );
  }
}
