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
  int xDays = 5;
  int selectedIndex = 0;

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
              minY: dtd(widget.model.currentPrice) * 0.5,
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
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  generateGraphic(5);
                  xDays = 5;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: xDays == 5
                      ? const Color.fromRGBO(238, 240, 247, 1)
                      : Colors.transparent,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 10,
                ),
                child: Text(
                  '5D',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  generateGraphic(15);
                  xDays = 15;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: xDays == 15
                      ? const Color.fromRGBO(238, 240, 247, 1)
                      : Colors.transparent,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 10,
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: Text(
                  '15D',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  generateGraphic(30);
                  xDays = 30;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: xDays == 30
                      ? const Color.fromRGBO(238, 240, 247, 1)
                      : Colors.transparent,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 10,
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: Text(
                  '30D',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  generateGraphic(45);
                  xDays = 45;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: xDays == 45
                      ? const Color.fromRGBO(238, 240, 247, 1)
                      : Colors.transparent,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 10,
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: Text(
                  '45D',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  generateGraphic(90);
                  xDays = 90;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: xDays == 90
                      ? const Color.fromRGBO(238, 240, 247, 1)
                      : Colors.transparent,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 10,
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: Text(
                  '90D',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
