
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartBuilder extends StatelessWidget {
  const ChartBuilder({super.key, required this.positions, required this.dates, required this.minimalOptimal, required this.maximalOptimal});


  final double? minimalOptimal;
  final double? maximalOptimal;
  final List<double?> positions;
  final List<String?> dates;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
          chardData
      ),
    );
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
          axisNameWidget: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Min optimal: ${minimalOptimal ?? 0.0}'),
                Text('Max optimal: ${maximalOptimal ?? 0.0}'),
              ],
            ),
          ),
          axisNameSize: 24,
          sideTitles: SideTitles(showTitles: false)
      ),
      leftTitles: AxisTitles(
        sideTitles: leftTitles(),
      )
  );


  SideTitles leftTitles() {

    double? max = positions.reduce((currentMax, element) => currentMax! > element! ? currentMax : element);
    double? min = positions.reduce((currentMin, element) => currentMin! < element! ? currentMin : element);
    double interval = 5;

    if(max!= null && min!= null && max != 0){
      interval = (max - min)/positions.length;
    }


    return SideTitles(
      getTitlesWidget: leftTitleWidget,
      showTitles: true,
      interval: interval,
      reservedSize: 40,
    );
  }

  FlGridData get gridData => FlGridData(show: false);


  List<LineChartBarData> get lineBarsData => [
    lineChartBarsData,
  ];

  LineChartBarData get lineChartBarsData => LineChartBarData(

      color: Colors.purple,
      barWidth: 3,
      spots: positions.asMap().entries.map((entry) {
        return FlSpot(entry.key + 1, entry.value ?? 0.0);
      }).toList()
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
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.grey
    );

    Widget text = Text(dates.isNotEmpty?dates[value.toInt() - 1]!: 'un',style: style);

    return SideTitleWidget(child: text, axisSide: meta.axisSide, space: 10,);
  }




  Widget leftTitleWidget(double value, TitleMeta meta){
    const style = TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.grey
    );
    String text = '${value.toInt()}';

    return Text(text, style: style,);
  }
}

