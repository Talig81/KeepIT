import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'coisas.dart';

class StatsCharts extends StatefulWidget {
  _StatsCharts createState() => _StatsCharts();
}

class _StatsCharts extends State<StatsCharts> {
  @override
  void initState() {
    super.initState();
  }

  final List<ChartStuff> chartsData;

  _StatsCharts({this.chartsData});

  Widget build(BuildContext context) {
    List<ChartStuff> chartsData = [
      ChartStuff(
          year: "2019",
          category: "Saúde",
          valueSpent: 300,
          color: charts.ColorUtil.fromDartColor(Colors.blue)),
      ChartStuff(
          year: "2018",
          category: "Veículos",
          valueSpent: 1000,
          color: charts.ColorUtil.fromDartColor(Colors.pink)),
      ChartStuff(
          year: "2017",
          category: "Imobiliária",
          valueSpent: 5000,
          color: charts.ColorUtil.fromDartColor(Colors.orange)),
    ];
    List<charts.Series<ChartStuff, String>> series = [
      charts.Series(
          id: "Coisa",
          data: chartsData,
          domainFn: (ChartStuff chart, _) => chart.category,
          measureFn: (ChartStuff chart, _) => chart.valueSpent,
          colorFn: (ChartStuff chart, _) => chart.color),
    ];

    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
        padding: EdgeInsets.fromLTRB(50, 0, 0, 70),
        color: Colors.blue[100],
        child: charts.PieChart(
          series,
          behaviors: [
            charts.DatumLegend(
              position: charts.BehaviorPosition.end,
              //outsideJustification: charts.OutsideJustification.endDrawArea,
              entryTextStyle: charts.TextStyleSpec(),
              showMeasures: true,
              legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
              measureFormatter: (num value) {
            return value == null ? '-' : '- $value€';
          },
            ),
          ],
        ),
      ),
    );
  }
}
