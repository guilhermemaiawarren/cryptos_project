import 'package:flutter/material.dart';
import 'package:projeto_criptos/src/presenter/screens/wallet/widgets/custom_bottom_navigation_bar.dart';
import 'package:projeto_criptos/src/presenter/screens/wallet/widgets/body_wallet.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyWallet(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
