import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/details/widgets/body_details_screen.dart';

import '../../shared/common_model/crypto.dart';
import '../../shared/templates/error_body.dart';
import '../../shared/templates/loading_body.dart';
import '../controller/historic_data_provider.dart';

class DetailsScreen extends HookConsumerWidget {
  const DetailsScreen({
    Key? key,
    required this.coin,
    required this.coinAmmount,
  }) : super(key: key);
  final CryptoEntity coin;
  final Decimal coinAmmount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoData = ref.watch(historicDataProvider(coin.id));

    return cryptoData.when(
      data: (data) {
        return BodyDetailsScreen(
          data: data,
          coin: coin,
          coinAmmount: coinAmmount,
        );
      },
      error: (e, r) {
        return ErrorBody(
          onRetry: () {
            ref.refresh(
              historicDataProvider(coin.id),
            );
          },
        );
      },
      loading: () {
        return const LoadingBody();
      },
    );
  }
}
