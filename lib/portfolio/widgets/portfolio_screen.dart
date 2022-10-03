import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/templates/error_body.dart';
import '../../shared/templates/loading_body.dart';
import '../controller/cryptos_provider.dart';
import 'wallet_assets_list_view.dart';
import 'wallet_visibility.dart';

class PortfolioScreen extends HookConsumerWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptos = ref.watch(cryptosProvider);
    return cryptos.when(
      data: (data) {
        return Column(
          children: [
            const WalletVisibility(),
            WalletAssetsListView(cryptosData: data),
          ],
        );
      },
      error: (e, s) {
        debugPrint(e.toString());
        debugPrint(s.toString());
        return ErrorBody(
          onRetry: () {
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
