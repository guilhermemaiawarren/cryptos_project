import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/templates/app_assets.dart';
import '../provider/days_provider.dart';

class GraphDetails extends ConsumerWidget {
  const GraphDetails({Key? key, required this.historyCoinData})
      : super(key: key);
  final List<FlSpot> historyCoinData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: AspectRatio(
        aspectRatio: 16 / 5,
        child: LineChart(
          LineChartData(
            lineTouchData: LineTouchData(
              enabled: false,
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
