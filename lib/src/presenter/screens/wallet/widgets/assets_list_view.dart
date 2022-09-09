import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/utils/currency_formater.dart';

import '../../../../domain/entities/asset_model.dart';
import '../../../provider/user_provider.dart';
import 'crypto_list_tile.dart';

class AssetsListView extends HookConsumerWidget {
  const AssetsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider.state);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: user.state.assets.length,
        itemBuilder: (context, index) {
          AssetModel asset = user.state.assets[index];
          String balance = formatter.format(asset.coinBalance * asset.price);
          bool variation = asset.variation > 0;
          return Column(
            children: [
              const Divider(thickness: 1),
              CryptoListTile(
                asset: asset,
                balance: balance,
                variation: variation,
              ),
            ],
          );
        },
      ),
    );
  }
}
