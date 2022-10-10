import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../widgets/body_details_screen.dart';
import '../../portfolio/provider/cryptos_provider.dart';

import '../../portfolio/model/crypto_view_data.dart';
import '../../shared/templates/error_body.dart';
import '../../shared/templates/loading_body.dart';
import '../provider/historic_data_provider.dart';

class DetailsScreen extends HookConsumerWidget {
  const DetailsScreen({
    super.key,
    required this.coin,
    required this.coinAmmount,
  });
  final CryptoViewData coin;
  final Decimal coinAmmount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptos = ref.watch(cryptosProvider);
    final cryptoData = ref.watch(historicDataProvider(coin.id));

    return cryptoData.when(
      data: (data) {
        return BodyDetailsScreen(
          data: data,
          coin: coin,
          coinAmmount: coinAmmount,
          cryptos: cryptos.asData!.value,
        );
      },
      error: (e, r) {
        return ErrorBody(onRetry: () {
          ref.refresh(historicDataProvider(coin.id));
        });
      },
      loading: () {
        return const LoadingBody();
      },
    );
  }
}
