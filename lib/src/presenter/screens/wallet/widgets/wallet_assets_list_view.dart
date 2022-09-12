import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/src/domain/entities/asset.dart';
import 'package:projeto_criptos/src/presenter/provider/assets_provider.dart';

import 'asset_list_tile.dart';

class WalletAssetsListView extends HookConsumerWidget {
  const WalletAssetsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<AssetEntity> assets = ref.watch(assetsProvider);
    return Expanded(
      child: ListView.separated(
        physics: const ClampingScrollPhysics(),
        itemCount: assets.length,
        separatorBuilder: (context, index) => const Divider(thickness: 1),
        itemBuilder: (context, index) {
          AssetEntity asset = assets[index];
          return AssetListTile(asset: asset);
        },
      ),
    );
  }
}
