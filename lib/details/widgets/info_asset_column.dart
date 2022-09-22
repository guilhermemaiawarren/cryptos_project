import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/details/controller/graph_axis_provider.dart';
import 'package:projeto_criptos/details/controller/list_provider.dart';
import 'package:projeto_criptos/details/model/prices_view_data.dart';

import '../../portfolio/model/crypto_view_data.dart';
import '../../shared/utils/currency_formater.dart';
import '../controller/details_asset_notifier_provider.dart';
import 'info_card_asset.dart';

class InfoColumn extends HookConsumerWidget {
  const InfoColumn({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CryptoViewData model = ref.watch(detailsAssetProvider.notifier).state;
    int time = ref.watch(graphAxisProvider.state).state;
    PricesViewData prices = ref.watch(listProvider.state).state;
    double rangePrice = prices.prices.isEmpty ? 0 : prices.prices.first.last.toDouble();
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
              rangePrice,
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
            text: '0.5 ${model.symbol.toUpperCase()}',
          ),
          const Divider(thickness: 1),
          InfoCardDetails(
            label: 'Valor',
            text: currencyFormatter.format(
              model.currentPrice * 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
