import 'package:example/chart/color_extensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class BarChartExample extends StatefulWidget {

  BarChartExample({Key? key}) : super(key: key);

  final Color dark = AppColors.contentColorCyan.darken(60);
  final Color normal = AppColors.contentColorCyan.darken(30);
  final Color light = AppColors.contentColorCyan;

  @override
  State<BarChartExample> createState() => _BarChartExampleState();

}

class _BarChartExampleState extends State<BarChartExample> {

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = '周一';
        break;
      case 1:
        text = '周二';
        break;
      case 2:
        text = '周三';
        break;
      case 3:
        text = '周四';
        break;
      case 4:
        text = '周五';
        break;
      case 5:
        text = '周六';
        break;
      case 6:
        text = '周日';
        break;

      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return Container();
    }
    const style = TextStyle(
      fontSize: 10,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        meta.formattedValue,
        style: style,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('本周正常打卡人数'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final barsSpace = 4.0 * constraints.maxWidth / 400;
          final barsWidth = 8.0 * constraints.maxWidth / 400;
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.center,
                  barTouchData: BarTouchData(
                    enabled: false,
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        getTitlesWidget: bottomTitles,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: leftTitles,
                      ),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    checkToShowHorizontalLine: (value) => value % 10 == 0,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: AppColors.borderColor.withOpacity(0.1),
                      strokeWidth: 1,
                    ),
                    drawVerticalLine: false,
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  groupsSpace: 30,
                  barGroups: getData(barsWidth, barsSpace),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<BarChartGroupData> getData(double barsWidth, double barsSpace) {
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: barsSpace,
        barRods: [

          BarChartRodData(
            toY: 14000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 14000000000, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: 20,

          ),

        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 15000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 15000000000, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: 20,
          ),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 15500000000,
            rodStackItems: [
              BarChartRodStackItem(0, 15500000000, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: 20,
          ),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 14000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 14000000000, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: 20,
          ),
        ],
      ),
      BarChartGroupData(
        x: 4,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 14500000000,
            rodStackItems: [
              BarChartRodStackItem(0, 14500000000, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: 20,
          ),
        ],
      ),

      BarChartGroupData(
        x: 5,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 1450000000,
            rodStackItems: [
              BarChartRodStackItem(0, 1450000000, Colors.green),
            ],
            borderRadius: BorderRadius.zero,
            width: 20,
          ),
        ],
      ),

      BarChartGroupData(
        x: 6,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 1450000000,
            rodStackItems: [
              BarChartRodStackItem(0, 1450000000, Colors.green),
            ],
            borderRadius: BorderRadius.zero,
            width: 20,
          ),
        ],
      ),


    ];
  }

}
