import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/common_model/crypto.dart';
import '../../shared/templates/app_assets.dart';
import '../../shared/templates/error_body.dart';
import '../../shared/templates/loading_body.dart';
import '../../shared/templates/warren_button.dart';
import '../../shared/utils/arguments/to_conversion_arguments.dart';
import '../../shared/utils/currency_formater.dart';
import '../../shared/utils/decimal_to_double.dart';
import '../controller/days_provider.dart';
import '../controller/historic_data_provider.dart';
import 'change_days_buttons.dart';
import 'graph_details.dart';
import 'info_row_details.dart';
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
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 20,
                  bottom: 20,
                ),
                child: Column(
                  children: [
                    const Divider(thickness: 1),
                    InfoRowDetails(
                      label: 'Preço ${day}D',
                      text: currencyFormatter.format(
                        data.prices.reversed.elementAt(day).last,
                      ),
                    ),
                    const Divider(thickness: 1),
                    InfoRowDetails(
                      label: 'Variação ${day}D',
                      text:
                          '${variation > 0 ? '+' : ''} ${variation.toStringAsFixed(2)}%',
                      color: variation > 0 ? Colors.green : Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                    const Divider(thickness: 1),
                    InfoRowDetails(
                      label: 'Quantidade',
                      text:
                          '${coinAmmount.toStringAsFixed(4)} ${coin.symbol.toUpperCase()}',
                    ),
                    const Divider(thickness: 1),
                    InfoRowDetails(
                      label: 'Valor',
                      text: currencyFormatter.format(
                        dtd(coinAmmount * coin.currentPrice),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: WarrenButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/conversion',
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
