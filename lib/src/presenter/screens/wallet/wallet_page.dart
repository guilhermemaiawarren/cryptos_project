import 'package:flutter/material.dart';
import 'package:projeto_criptos/src/presenter/screens/wallet/widgets/custom_bottom_navigation.dart';
import 'package:projeto_criptos/src/presenter/screens/wallet/widgets/home_body.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WalletBody(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}
