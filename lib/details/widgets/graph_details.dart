import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/details/controller/details_asset_provider.dart';
import 'package:projeto_criptos/details/controller/x_axis_provider.dart';
import 'package:projeto_criptos/shared/models/asset_model.dart';

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
    for (int i = 0; i < days; i++) {
      spots.add(
        FlSpot(
          double.parse(
            (i++).toString(),
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
            minX: 0,
            minY: dtd(model.currentPrice) * 0.5,
            maxX: xDays.toDouble() - 1,
            maxY: dtd(model.currentPrice) * 1.5,
            lineBarsData: [
              LineChartBarData(
                barWidth: 3,
                isCurved: true,
                dotData: FlDotData(show: false),
                color: const Color.fromRGBO(224, 43, 87, 1),
                spots: generateGraphic(xDays),
              )
            ],
          ),
          swapAnimationDuration: const Duration(milliseconds: 500),
          swapAnimationCurve: Curves.linear,
        ),
      ),
    );
  }
}
