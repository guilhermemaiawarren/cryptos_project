import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/portfolio/controller/balance_provider.dart';
import 'package:projeto_criptos/shared/models/asset_model.dart';

import '../controller/assets_provider.dart';
import 'asset_list_tile.dart';

class WalletAssetsListView extends StatefulHookConsumerWidget {
  const WalletAssetsListView({Key? key}) : super(key: key);

  @override
  ConsumerState<WalletAssetsListView> createState() =>
      _WalletAssetsListViewState();
}

class _WalletAssetsListViewState extends ConsumerState<WalletAssetsListView> {
  late List<AssetModel> assets;

  double getBalance() {
    double balance = 0.0;
    for (AssetModel asset in assets) {
      balance += asset.currentPrice * 0.5;
    }
    return balance;
  }

  @override
  Widget build(BuildContext context) {
    assets = ref.watch(assetsNotifierProvider);
    Future.delayed(Duration.zero, () {
      ref.read(balanceProvider.state).state = getBalance();
    });
    return Visibility(
      visible: assets.isNotEmpty,
      child: Expanded(
        child: ListView.separated(
          physics: const ClampingScrollPhysics(),
          itemCount: assets.length,
          separatorBuilder: (context, index) => const Divider(thickness: 1),
          itemBuilder: (context, index) {
            AssetModel asset = assets[index];
            return AssetListTile(asset: asset);
          },
        ),
      ),
    );
  }
}
