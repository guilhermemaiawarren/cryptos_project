import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:projeto_criptos/details/model/prices_view_data.dart';
import 'package:projeto_criptos/details/widgets/top_page_container.dart';
import 'package:projeto_criptos/portfolio/provider/cryptos_provider.dart';

import '../../conversion/view/conversion_page.dart';
import '../../l10n/core_strings.dart';
import '../../shared/common_model/crypto.dart';
import '../../shared/templates/app_assets.dart';
import '../../shared/templates/warren_button.dart';
import '../../shared/utils/arguments/to_conversion_arguments.dart';
import '../controller/days_provider.dart';
import 'change_days_buttons.dart';
import 'graph_details.dart';
import 'info_column.dart';

class BodyDetailsScreen extends ConsumerWidget {
  const BodyDetailsScreen({
    Key? key,
    required this.data,
    required this.coin,
    required this.coinAmmount,
  }) : super(key: key);
  final PricesViewData data;
  final CryptoEntity coin;
  final Decimal coinAmmount;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptos = ref.watch(cryptosProvider);
    int day = ref.watch(daysProvider.state).state;
    double variation =
        (data.prices.last.last / data.prices.reversed.elementAt(day).last - 1) *
            100;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TopPageContainer(
            model: coin,
          ),
          GraphDetails(
            historyCoinData: List<FlSpot>.from(
              data.prices.reversed.map(
                (crypto) {
                  return FlSpot(
                    crypto[0].toDouble(),
                    crypto[1].toDouble(),
                  );
                },
              ),
            ),
          ),
          const ChangeDaysButtons(),
          InfoColumn(
            day: day,
            variation: variation,
            coinAmmount: coinAmmount,
            coin: coin,
            data: data,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: WarrenButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ConversionPage.route,
                  arguments: ToConversionArguments(
                    cryptoAmmount: coinAmmount,
                    crypto: coin,
                    data: cryptos.asData!.value,
                  ),
                );
              },
              text: CoreStrings.of(context)!.convertCoin,
              color: AppAssets.magenta,
            ),
          ),
        ],
      ),
    );
  }
}
