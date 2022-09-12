import 'package:flutter/material.dart';
import 'package:projeto_criptos/src/presenter/screens/wallet/widgets/wallet_assets_list_view.dart';
import 'package:projeto_criptos/src/presenter/screens/wallet/widgets/wallet_visibility.dart';


class BodyWalletScreen extends StatelessWidget {
  const BodyWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        WalletVisibility(),
        WalletAssetsListView(),
      ],
    );
  }
}
