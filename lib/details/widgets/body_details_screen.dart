import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../shared/templates/app_assets.dart';
import '../controller/days_provider.dart';
import '../controller/historic_data_provider.dart';
import 'info_row_details.dart';
import '../../portfolio/model/crypto_view_data.dart';
import '../../shared/utils/currency_formater.dart';

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
        double variation =
            (data.prices.last.last / data.prices.reversed.elementAt(day).last -
                    1) *
                100;
        return SingleChildScrollView(
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
                      text: '0.5 ${coin.symbol.toUpperCase()}',
                    ),
                    const Divider(thickness: 1),
                    InfoRowDetails(
                      label: 'Valor',
                      text: currencyFormatter.format(coin.currentPrice * 0.5),
                    ),
                  ],
                ),
              ),
              WarrenButton(onPressed: () {}),
            ],
          ),
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
        Future.delayed(const Duration(seconds: 3));
        return Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
              color: AppAssets.magenta, size: 200),
        );
      },
    );
  }
}
