import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
// import 'package:mongo_dart/mongo_dart.dart';
import 'package:waterdetection/components/graph_bar/bar_data.dart';

class GraphBar extends StatelessWidget {
  final List SummaryWater;

  const GraphBar({
    super.key,
    required this.SummaryWater,
  });

  @override
  Widget build(BuildContext context) {
    BarData Bar = BarData(
      MonWater: SummaryWater[0],
      TueWater: SummaryWater[1],
      WedWater: SummaryWater[2],
      ThuWater: SummaryWater[3],
      FriWater: SummaryWater[4],
      SatWater: SummaryWater[5],
      SunWater: SummaryWater[6],
    );
    Bar.Init_BarData();

    return BarChart(
      BarChartData(
        maxY: 100,
        minY: 0,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true, getTitlesWidget: getBottomTitles)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        barGroups: Bar.data_bar
            .map((data) => BarChartGroupData(
                  x: data.x,
                  barRods: [
                    BarChartRodData(
                      toY: data.y.toDouble(),
                      color: Color.fromRGBO(0, 78, 131, 10),
                      width: 20,
                      borderRadius: BorderRadius.circular(4),
                      backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          color: Color.fromARGB(255, 181, 181, 181),
                          fromY: 100),
                    ),
                  ],
                ))
            .toList(),
      ),
    );
  }
}

Widget getBottomTitles(double val, TitleMeta meta) {
  const style = TextStyle(
    color: Color.fromRGBO(0, 78, 131, 10),
    fontWeight: FontWeight.w700,
    fontSize: 13,
  );
  Widget text;
  switch (val.toInt()) {
    case 0:
      text = Text(
        'M',
        style: style,
      );
      break;
    case 1:
      text = Text(
        'T',
        style: style,
      );
      break;
    case 2:
      text = Text(
        'W',
        style: style,
      );
      break;
    case 3:
      text = Text(
        'T',
        style: style,
      );
      break;
    case 4:
      text = Text(
        'F',
        style: style,
      );
      break;
    case 5:
      text = Text(
        'S',
        style: style,
      );
      break;
    case 6:
      text = Text(
        'S',
        style: style,
      );
      break;
    default:
      text = Text(
        '',
        style: style,
      );
      break;
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
