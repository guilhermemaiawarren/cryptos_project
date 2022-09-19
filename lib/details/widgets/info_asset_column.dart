import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/details/controller/range_price_provider.dart';
import 'package:projeto_criptos/details/controller/graph_axis_provider.dart';

import '../../shared/models/asset_model.dart';
import '../../shared/utils/currency_formater.dart';
import '../../shared/utils/decimal_to_double.dart';
import 'info_card_asset.dart';

class InfoColumn extends HookConsumerWidget {
  InfoColumn({
    Key? key,
  }) : super(key: key);
  late AssetModel model;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // AssetModel model = ref.watch(detailsAssetProvider.notifier).state;
    int time = ref.watch(graphAxisProvider.state).state;
    Decimal rangePrice = ref.watch(rangePriceProvider.notifier).state;

    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
      ),
      child: Column(
        children: [
          const Divider(thickness: 1),
          InfoCardDetails(
            label: time == 1 ? 'Preço Atual' : 'Preço ${time}D',
            text: currencyFormatter.format(
              dtd(rangePrice),
            ),
          ),
          const Divider(thickness: 1),
          InfoCardDetails(
            label: 'Variação ${time == 24 || time == 1 ? '24H' : '${time}D'}',
            text:
                '${model.variation > 0 ? '+' : ''}${model.variation.toStringAsFixed(2)}%',
            color: model.variation > 0 ? Colors.green : Colors.red,
            fontWeight: FontWeight.w500,
          ),
          const Divider(thickness: 1),
          InfoCardDetails(
            label: 'Quantidade',
            text: '${model.coinBalance.toString()} ${model.symbol}',
          ),
          const Divider(thickness: 1),
          InfoCardDetails(
            label: 'Valor',
            text: currencyFormatter.format(
              dtd(model.coinBalance) * dtd(model.currentPrice),
            ),
          ),
        ],
      ),
    );
  }
}
