import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/conversion/view/conversion_page.dart';

import '../../shared/common_model/crypto.dart';
import '../../shared/templates/app_assets.dart';
import '../../shared/templates/error_body.dart';
import '../../shared/templates/loading_body.dart';
import '../../shared/templates/warren_button.dart';
import '../../shared/utils/arguments/to_conversion_arguments.dart';
import '../controller/days_provider.dart';
import '../controller/historic_data_provider.dart';
import 'change_days_buttons.dart';
import 'graph_details.dart';
import 'info_column.dart';
import 'top_page_container.dart';

class BodyDetailsScreen extends HookConsumerWidget {
  const BodyDetailsScreen({
    Key? key,
    required this.coin,
    required this.coinAmmount,
  }) : super(key: key);
  final CryptoEntity coin;
  final Decimal coinAmmount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoData = ref.watch(historicDataProvider(coin.id));
    int day = ref.watch(daysProvider.state).state;

    return cryptoData.when(
      data: (data) {
        double variation =
            (data.prices.last.last / data.prices.reversed.elementAt(day).last -
                    1) *
                100;
        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
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
                        ),
                      );
                    },
                    text: 'Converter Moeda',
                    color: AppAssets.magenta,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (e, r) {
        return ErrorBody(
          onError: () {
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
