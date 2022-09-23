import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controller/balance_provider.dart';
import '../controller/cryptos_provider.dart';
import '../model/crypto_view_data.dart';

import 'asset_list_tile.dart';

class WalletAssetsListView extends HookConsumerWidget {
  const WalletAssetsListView({Key? key}) : super(key: key);

  double getBalance(List<CryptoViewData> assets) {
    double balance = 0.0;
    for (CryptoViewData asset in assets) {
      balance += asset.currentPrice * 0.5;
    }
    return balance;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptos = ref.watch(cryptosProvider);

    return cryptos.when(
      data: (data) {
        Future.delayed(
          Duration.zero,
          () {
            ref.read(balanceProvider.state).state = getBalance(data);
          },
        );
        return Expanded(
          child: ListView.separated(
            physics: const ClampingScrollPhysics(),
            itemCount: data.length,
            separatorBuilder: (context, index) => const Divider(thickness: 1),
            itemBuilder: (context, index) {
              CryptoViewData crypto = data[index];
              return AssetListTile(crypto: crypto);
            },
          ),
        );
      },
      error: (error, stackTrace) {
        print(error.toString());
        return const Center(
          child: Text('Deu erro'),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
