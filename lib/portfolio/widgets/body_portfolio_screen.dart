import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../shared/templates/loading_body.dart';
import '../../shared/templates/error_body.dart';
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
        debugPrint(e.toString());
        debugPrint(s.toString());
        return ErrorBody(
          onError: () {
            ref.refresh(cryptosProvider);
          },
        );
      },
      loading: () {
        return const LoadingBody();
      },
    );
  }
}
