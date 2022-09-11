import 'package:flutter/material.dart';
import 'package:projeto_criptos/src/presenter/screens/wallet/widgets/wallet_visibility.dart';

import 'assets_list_view.dart';

class BodyWallet extends StatelessWidget {
  const BodyWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WalletVisibility(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.045),
        const AssetsListView(),
      ],
    );
  }
}
