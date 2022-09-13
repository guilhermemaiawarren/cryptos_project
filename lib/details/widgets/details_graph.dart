import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:projeto_criptos/shared/models/asset_model.dart';

import '../../shared/utils/decimal_to_double.dart';

class DetailsGraph extends StatefulWidget {
  const DetailsGraph({
    Key? key,
    required this.model,
  }) : super(key: key);

  final AssetModel model;

  @override
  State<DetailsGraph> createState() => _DetailsGraphState();
}

class _DetailsGraphState extends State<DetailsGraph> {
  int xDays = 4;

  List<FlSpot> generateGraphic(int days) {
    List<FlSpot> spots = [];
    xDays = days;
    for (int i = 0; i < days; i++) {
      spots.add(
        FlSpot(
          double.parse(
            (i++).toString(),
          ),
          dtd(widget.model.prices[i]),
        ),
      );
    }
    return spots;
  }

  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
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
              minY: dtd(widget.model.currentPrice) * 0.75,
              maxX: xDays.toDouble() - 1,
              maxY: dtd(widget.model.currentPrice) * 1.5,
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
        const Padding(padding: EdgeInsets.all(5)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                generateGraphic(5);
                setState(() {
                  xDays = 5;
                });
              },
              child: const Text('5D'),
            ),
            InkWell(
              onTap: () {
                generateGraphic(15);
                setState(() {
                  xDays = 15;
                });
              },
              child: const Text('15D'),
            ),
            InkWell(
              onTap: () {
                generateGraphic(30);
                setState(() {
                  xDays = 30;
                });
              },
              child: const Text('30D'),
            ),
            InkWell(
              onTap: () {
                generateGraphic(45);
                setState(() {
                  xDays = 45;
                });
              },
              child: const Text('45D'),
            ),
            InkWell(
              onTap: () {
                generateGraphic(90);
                setState(() {
                  xDays = 90;
                });
              },
              child: const Text('90D'),
            ),
          ],
        )
      ],
    );
  }
}
