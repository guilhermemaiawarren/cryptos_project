import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/details/controller/get_historic_data_provider.dart';

import '../../shared/models/asset_model.dart';
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
  late AssetModel model;

  List<FlSpot> generateGraphic() {
    List<FlSpot> spots = [];
    List<double> coinData = ref.watch(getHistoricDataProvider.notifier).state;
    for (int index = 0; index < coinData.length; index++) {
      spots.add(
        FlSpot(
          index.toDouble(),
          coinData[0],
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
            minY: model.currentPrice * 0.25,
            maxY: model.currentPrice * 1.75,
            lineBarsData: [
              LineChartBarData(
                belowBarData: BarAreaData(
                  show: true,
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(224, 43, 87, 0.5),
                      Color.fromRGBO(224, 43, 87, 0.02),
                    ],
                  ),
                ),
                barWidth: 3,
                dotData: FlDotData(show: false),
                color: AppAssets.magenta,
                spots: generateGraphic(),
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
