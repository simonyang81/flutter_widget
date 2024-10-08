import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'indicator.dart';

class PieChartExample extends StatefulWidget {
  const PieChartExample({Key? key}) : super(key: key);

  @override
  State<PieChartExample> createState() => _PieChartExampleState();
}

class _PieChartExampleState extends State<PieChartExample> {

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('考勤数据报表'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        touchedIndex = -1;
                        return;
                      }
                      touchedIndex = pieTouchResponse
                          .touchedSection!.touchedSectionIndex;
                    });
                  },
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 2,
                centerSpaceRadius: 40,
                sections: showingSections(),
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Indicator(
                color: Colors.green,
                text: '正常打卡',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Colors.amber,
                text: '迟到',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Colors.red,
                text: '缺卡',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Colors.blue,
                text: '早退',
                isSquare: true,
              ),
              SizedBox(
                height: 18,
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: 5,
            title: '5%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.amber,
            value: 5,
            title: '5%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.red,
            value: 5,
            title: '5%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.green,
            value: 85,
            title: '85%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }

}
