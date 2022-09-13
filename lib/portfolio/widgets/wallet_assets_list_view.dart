import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/shared/models/asset_model.dart';
import 'package:projeto_criptos/portfolio/controller/assets_provider.dart';

import 'asset_list_tile.dart';

class WalletAssetsListView extends HookConsumerWidget {
  const WalletAssetsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<AssetModel> assets = ref.watch(assetsProvider.notifier).state;
    return Expanded(
      child: ListView.separated(
        physics: const ClampingScrollPhysics(),
        itemCount: assets.length,
        separatorBuilder: (context, index) => const Divider(thickness: 1),
        itemBuilder: (context, index) {
          AssetModel asset = assets[index];
          return AssetListTile(asset: asset);
        },
      ),
    );
  }
}
