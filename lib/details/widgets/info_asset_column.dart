import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/details/controller/graph_axis_provider.dart';
import 'package:projeto_criptos/details/controller/list_provider.dart';

import '../../shared/models/asset_model.dart';
import '../../shared/utils/currency_formater.dart';
import '../controller/details_asset_notifier_provider.dart';
import 'info_card_asset.dart';

class InfoColumn extends HookConsumerWidget {
  const InfoColumn({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AssetModel model = ref.watch(detailsAssetProvider.notifier).state;
    int time = ref.watch(graphAxisProvider.state).state;
    double rangePrice = ref.watch(listProvider.state).state.isNotEmpty
        ? ref.watch(listProvider.state).state.first
        : 0.0;
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
                '${model.priceChangePercentage > 0 ? '+' : ''}${model.priceChangePercentage.toStringAsFixed(2)}%',
            color: model.priceChangePercentage > 0 ? Colors.green : Colors.red,
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
