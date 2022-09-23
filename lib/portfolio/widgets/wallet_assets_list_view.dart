import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/balance_provider.dart';
import '../model/crypto_view_data.dart';
import 'asset_list_tile.dart';

class WalletAssetsListView extends HookConsumerWidget {
  const WalletAssetsListView({
    Key? key,
    required this.cryptosData,
  }) : super(key: key);
  final List<CryptoViewData> cryptosData;
  double getBalance(List<CryptoViewData> assets) {
    double balance = 0.0;
    for (CryptoViewData asset in assets) {
      balance += asset.currentPrice * 0.5;
    }
    return balance;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(
      Duration.zero,
      () {
        ref.read(balanceProvider.state).state = getBalance(cryptosData);
      },
    );
    return Expanded(
      child: ListView.separated(
        physics: const ClampingScrollPhysics(),
        itemCount: cryptosData.length,
        separatorBuilder: (context, index) => const Divider(thickness: 1),
        itemBuilder: (context, index) {
          CryptoViewData crypto = cryptosData[index];
          return AssetListTile(crypto: crypto);
        },
      ),
    );
  }
}
