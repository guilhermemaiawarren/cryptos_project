import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/templates/error_body.dart';
import '../../shared/templates/loading_body.dart';
import '../provider/cryptos_provider.dart';
import '../widgets/body_portfolio_screen.dart';

class PortfolioScreen extends HookConsumerWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptos = ref.watch(cryptosProvider);
    return cryptos.when(data: (data) {
      return BodyPortfolioScreen(data: data);
    }, error: (e, s) {
      return ErrorBody(onRetry: () {
        ref.refresh(cryptosProvider);
      });
    }, loading: () {
      return const LoadingBody();
    });
  }
}
