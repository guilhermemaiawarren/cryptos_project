import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/details/controller/days_provider.dart';
import 'package:projeto_criptos/details/controller/historic_data_provider.dart';
import 'package:projeto_criptos/details/model/prices_view_data.dart';
import 'package:projeto_criptos/details/widgets/info_row_details.dart';
import 'package:projeto_criptos/portfolio/model/crypto_view_data.dart';
import 'package:projeto_criptos/shared/utils/currency_formater.dart';

import '../../shared/templates/warren_button.dart';
import 'graph_details.dart';
import 'change_days_buttons.dart';
import 'top_page_container.dart';

class BodyDetailsScreen extends HookConsumerWidget {
  const BodyDetailsScreen({
    Key? key,
    required this.coin,
  }) : super(key: key);
  final CryptoViewData coin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoData = ref.watch(historicDataProvider(coin.id));
    int day = ref.watch(daysProvider.state).state;

    return cryptoData.when(
      data: (data) {
        return FutureBuilder(
          future: ref.watch(historicDataProvider(coin.id).future),
          builder: (context, AsyncSnapshot<PricesViewData?> snapshot) {
            if (snapshot.hasData) {
              double variation = (snapshot.data!.prices.reversed.first.last /
                          snapshot.data!.prices.reversed.elementAt(day).last -
                      1) *
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
                        snapshot.data!.prices.reversed.map(
                          (crypto) {
                            return FlSpot(
                              //X = Timestamp
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
                              snapshot.data!.prices.reversed
                                  .elementAt(day)
                                  .last,
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
                            text: '0.5 ${coin.symbol.toUpperCase()}',
                          ),
                          const Divider(thickness: 1),
                          InfoRowDetails(
                            label: 'Valor',
                            text: currencyFormatter
                                .format(coin.currentPrice * 0.5),
                          ),
                        ],
                      ),
                    ),
                    WarrenButton(onPressed: () {}),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
      error: (e, r) {
        return Center(
          child: Column(
            children: const [
              Text('Ops! Deu erro'),
            ],
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
