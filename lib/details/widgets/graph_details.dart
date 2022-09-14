import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/details/controller/details_asset_provider.dart';
import 'package:projeto_criptos/details/controller/x_axis_provider.dart';
import 'package:projeto_criptos/shared/models/asset_model.dart';
import 'package:projeto_criptos/shared/templates/app_assets.dart';
import 'package:projeto_criptos/shared/utils/currency_formater.dart';

import '../../shared/utils/decimal_to_double.dart';

class GraphDetails extends StatefulHookConsumerWidget {
  const GraphDetails({Key? key}) : super(key: key);

  @override
  ConsumerState<GraphDetails> createState() => _GraphDetailsState();
}

class _GraphDetailsState extends ConsumerState<GraphDetails> {
  late AssetModel model;
  late int xDays;
  List<FlSpot> generateGraphic(int days) {
    List<FlSpot> spots = [];
    xDays = days;
    for (int i = 0; i < days; i++) {
      spots.add(
        FlSpot(
          double.parse(
            (i).toString(),
          ),
          dtd(model.prices[i]),
        ),
      );
    }
    return spots;
  }

  @override
  Widget build(BuildContext context) {
    xDays = ref.watch(xAxisProvider.state).state;
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
                      color: const Color.fromRGBO(224, 43, 87, 0.7),
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
                tooltipBgColor: const Color.fromRGBO(224, 43, 87, 1),
                tooltipPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                tooltipRoundedRadius: 15,
                getTooltipItems: (touchedSpots) {
                  return touchedSpots.map((touchedSpot) {
                    return LineTooltipItem(
                        currencyFormatter.format(touchedSpot.y),
                        const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ));
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
            minY: dtd(model.currentPrice) * 0.25,
            maxY: dtd(model.currentPrice) * 1.75,
            lineBarsData: [
              LineChartBarData(
                belowBarData: BarAreaData(
                  show: true,
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(224, 43, 87, 0.3),
                      Color.fromRGBO(224, 43, 87, 0.05),
                    ],
                  ),
                ),
                barWidth: 2,
                dotData: FlDotData(show: false),
                color: AppAssets.magenta,
                spots: generateGraphic(xDays),
              )
            ],
          ),
          swapAnimationDuration: const Duration(milliseconds: 500),
          swapAnimationCurve: Curves.easeIn,
        ),
      ),
    );
  }
}
