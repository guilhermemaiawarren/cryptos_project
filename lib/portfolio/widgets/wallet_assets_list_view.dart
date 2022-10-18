import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/user/user_coin_ammount_provider.dart';
import '../../shared/utils/decimal_parse.dart';
import '../model/crypto_view_data.dart';
import '../provider/balance_provider.dart';
import 'asset_list_tile.dart';

class WalletAssetsListView extends ConsumerWidget {
  const WalletAssetsListView({
    Key? key,
    required this.cryptosData,
  }) : super(key: key);
  final List<CryptoViewData> cryptosData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Decimal getBalance() {
      Decimal balance = dp('0.0');
      for (CryptoViewData asset in cryptosData) {
        balance += asset.currentPrice *
            dp(
              ref
                  .watch(userCoinAmmountProvider)[cryptosData.indexOf(asset)]
                  .toString(),
            );
      }
      return balance;
    }

    Future.delayed(
      Duration.zero,
      () {
        ref.read(balanceProvider.state).state = getBalance();
      },
    );
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: cryptosData.length,
      itemBuilder: (context, index) {
        CryptoViewData crypto = cryptosData[index];
        return Column(
          children: [
            const Divider(thickness: 1),
            AssetListTile(
              crypto: crypto,
              cryptoBalance: dp(
                ref.watch(userCoinAmmountProvider)[index].toString(),
              ),
            ),
          ],
        );
      },
    );
  }
}
