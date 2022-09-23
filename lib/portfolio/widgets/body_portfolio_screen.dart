import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../shared/templates/app_assets.dart';
import '../controller/cryptos_provider.dart';
import 'wallet_assets_list_view.dart';
import 'wallet_visibility.dart';

class BodyPortfolioScreen extends HookConsumerWidget {
  const BodyPortfolioScreen({Key? key}) : super(key: key);

  static const route = '/bodyPortfolio';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptos = ref.watch(cryptosProvider);

    return cryptos.when(
      data: (data) {
        return Column(
          children: [
            const WalletVisibility(),
            const Divider(thickness: 1),
            WalletAssetsListView(
              cryptosData: data,
            ),
          ],
        );
      },
      error: (e, s) {
        return const Center(
          child: Text('Deu erro'),
        );
      },
      loading: () {
        return Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: AppAssets.magenta,
            size: 150,
          ),
        );
      },
    );
  }
}
