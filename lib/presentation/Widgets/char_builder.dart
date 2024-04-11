
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartBuilder extends StatelessWidget {
  const ChartBuilder({super.key});



  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
          chardData
      ),
    );
  }
}


LineChartData get chardData => LineChartData(
  gridData: gridData,
  titlesData: titlesData,
  borderData: borderData,
  lineBarsData: lineBarsData
);


FlTitlesData get titlesData => FlTitlesData(
  bottomTitles: AxisTitles(
    sideTitles: bottomTitles,
  ),
  rightTitles: AxisTitles(
    sideTitles: SideTitles(showTitles: false)
  ),
  topTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false)
  ),
  leftTitles: AxisTitles(
    sideTitles: leftTitles(),
  )
);


SideTitles leftTitles() => SideTitles(
  getTitlesWidget: leftTitleWidget,
  showTitles: true,
  interval: 1,
  reservedSize: 40
);

FlGridData get gridData => FlGridData(show: false);


List<LineChartBarData> get lineBarsData => [
  lineChartBarsData,
  lineChartBarsData2,
  lineChartBarsData3,
];

LineChartBarData get lineChartBarsData => LineChartBarData(
  isCurved: true,
  color: Colors.purple,
  barWidth: 3,
  spots: [
    FlSpot(1, 1),
    FlSpot(2, 1.5),
    FlSpot(3, 1.6),
    FlSpot(4, 3.4),
    FlSpot(5, 2),
    FlSpot(6, 2.5),
    FlSpot(7, 1.6),
  ]
);

LineChartBarData get lineChartBarsData2 => LineChartBarData(
    isCurved: true,
    color: Colors.yellow,
    barWidth: 3,
    spots: [
      FlSpot(1, 1.5),
      FlSpot(2, 1.5),
      FlSpot(3, 1.5),
      FlSpot(4, 1.5),
      FlSpot(5, 1.5),
      FlSpot(6, 1.5),
      FlSpot(7, 1.5),
    ]
);

LineChartBarData get lineChartBarsData3 => LineChartBarData(
    isCurved: true,
    color: Colors.red,
    barWidth: 3,
    spots: [
      FlSpot(1, 3),
      FlSpot(2, 3),
      FlSpot(3, 3),
      FlSpot(4, 3),
      FlSpot(5, 3),
      FlSpot(6, 3),
      FlSpot(7, 3),
    ]
);

FlBorderData get borderData => FlBorderData(
  show: true,
  border: Border(
    bottom: BorderSide(color: Colors.grey,width: 4),
    left: BorderSide(color: Colors.grey),
    top: BorderSide(color: Colors.transparent),
    right: BorderSide(color: Colors.transparent),
  ),

);

SideTitles get bottomTitles => SideTitles(
    getTitlesWidget: bottomTitleWidgets,
    showTitles: true,
    interval: 1,
    reservedSize: 32
);

Widget bottomTitleWidgets(double value, TitleMeta meta){
  const style = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.grey
  );
  Widget text = Text('12',style: style,);

  return SideTitleWidget(child: text, axisSide: meta.axisSide, space: 10,);
}


Widget leftTitleWidget(double value, TitleMeta meta){
  const style = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.grey
  );
  String text = '$value';

  return Text(text, style: style,);
}