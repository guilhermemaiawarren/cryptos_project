import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/templates/app_assets.dart';
import '../../shared/utils/currency_formater.dart';
import '../controller/days_provider.dart';

class GraphDetails extends HookConsumerWidget {
  const GraphDetails({Key? key, required this.historyCoinData}) : super(key: key);
  final List<FlSpot> historyCoinData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20
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
                spots: historyCoinData.sublist(
                  0,
                  ref.watch(daysProvider.state).state + 1,
                ),
              ),
            ],
          ),
          swapAnimationDuration: const Duration(milliseconds: 350),
          swapAnimationCurve: Curves.linearToEaseOut,
        ),
      ),
    );
  }
}
