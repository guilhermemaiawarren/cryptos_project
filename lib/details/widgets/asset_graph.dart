import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/details/controller/get_historic_data_provider.dart';
import 'package:projeto_criptos/details/controller/list_provider.dart';
import 'package:projeto_criptos/details/model/prices_view_data.dart';
import 'package:projeto_criptos/portfolio/model/crypto_view_data.dart';

import '../../shared/templates/app_assets.dart';
import '../../shared/utils/currency_formater.dart';
import '../controller/details_asset_notifier_provider.dart';
import '../controller/graph_axis_provider.dart';

class GraphDetails extends StatefulHookConsumerWidget {
  const GraphDetails({Key? key}) : super(key: key);

  @override
  ConsumerState<GraphDetails> createState() => _GraphDetailsState();
}

class _GraphDetailsState extends ConsumerState<GraphDetails> {
  late CryptoViewData model;
  late PricesViewData coinData;

  List<FlSpot> generateGraphic() {
    List<FlSpot> spots = [];
    for (int index = 0; index < coinData.prices.length; index++) {
      print(coinData.prices[index].last.toDouble().toString());
      spots.add(
        FlSpot(
          index.toDouble(),
          coinData.prices[index].last.toDouble(),
        ),
      );
    }
    return spots;
  }

  @override
  void initState() {
    super.initState();
    ref.read(graphAxisProvider.state).state = 1;
  }

  @override
  Widget build(BuildContext context) {
    model = ref.read(detailsAssetProvider.notifier).state;
    coinData = ref.watch(listProvider.state).state;
    final cryptos = ref.watch(
      pricesProvider(model.id),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: AspectRatio(
        aspectRatio: 1.7,
        child: LineChart(
          LineChartData(
            lineTouchData: LineTouchData(
              getTouchedSpotIndicator:
                  (LineChartBarData barData, List<int> spotIndexes) {
                return spotIndexes.map((index) {
                  return TouchedSpotIndicatorData(
                    FlLine(
                      color: const Color.fromRGBO(224, 43, 87, 1),
                      strokeWidth: 1,
                      dashArray: [3, 3],
                    ),
                    FlDotData(
                      show: false,
                    ),
                  );
                }).toList();
              },
              touchTooltipData: LineTouchTooltipData(
                fitInsideHorizontally: true,
                tooltipBgColor: AppAssets.magenta,
                tooltipPadding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 5,
                ),
                tooltipRoundedRadius: 15,
                getTooltipItems: (touchedSpots) {
                  return touchedSpots.map((touchedSpot) {
                    return LineTooltipItem(
                      currencyFormatter.format(touchedSpot.y),
                      const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }).toList();
                },
              ),
            ),
            gridData: FlGridData(show: false),
            borderData: FlBorderData(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade300,
                  width: 2,
                ),
              ),
            ),
            titlesData: FlTitlesData(show: false),
            lineBarsData: [
              LineChartBarData(
                belowBarData: BarAreaData(
                  show: true,
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(224, 43, 87, 0.2),
                      Color.fromRGBO(224, 43, 87, 0.02),
                    ],
                  ),
                ),
                barWidth: 3,
                dotData: FlDotData(show: false),
                color: AppAssets.magenta,
                spots: cryptos.when(
                  data: (data) => generateGraphic(),
                  error: (e, s) {
                    print(e.toString());
                    print(s.toString());
                    return [];
                  },
                  loading: () => [],
                ),
              ),
            ],
          ),
          swapAnimationDuration: const Duration(milliseconds: 350),
          swapAnimationCurve: Curves.easeIn,
        ),
      ),
    );
  }
}
