import 'package:flutter/material.dart';
import 'wallet_assets_list_view.dart';
import 'wallet_visibility.dart';

import '../model/crypto_view_data.dart';

class BodyPortfolioScreen extends StatelessWidget {
  const BodyPortfolioScreen({
    Key? key,
    required this.data,
  }) : super(key: key);
  final List<CryptoViewData> data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WalletVisibility(),
        Expanded(child: WalletAssetsListView(cryptosData: data)),
      ],
    );
  }
}
