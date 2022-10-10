import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/details/view/details_screen.dart';
import 'package:projeto_criptos/l10n/core_strings.dart';
import '../../portfolio/model/crypto_view_data.dart';
import '../provider/get_price_provider.dart';

import '../provider/days_provider.dart';
import '../../shared/templates/model_app_bar.dart';

class DetailsPage extends HookConsumerWidget {
  const DetailsPage({
    super.key,
    required this.asset,
    required this.coinAmmount,
  });
  static const route = '/details';

  final CryptoViewData asset;
  final Decimal coinAmmount;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(Duration.zero, () {
      ref.read(daysProvider.state).state = 5;
      ref.read(getPriceProvider.state).state = '';
    });
    return Scaffold(
      appBar: ModelAppBar(
        text: CoreStrings.of(context)!.details,
      ),
      body: DetailsScreen(
        coin: asset,
        coinAmmount: coinAmmount,
      ),
    );
  }
}
