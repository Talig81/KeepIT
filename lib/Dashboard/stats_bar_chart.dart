import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'coisas.dart';

class StatsBarChart extends StatefulWidget {
  _StatsBarChart createState() => _StatsBarChart();
}

class _StatsBarChart extends State<StatsBarChart> {
  @override
  void initState() {
    super.initState();
  }

  final List<ChartStuff> chartsData;

  _StatsBarChart({this.chartsData});

  Widget build(BuildContext context) {
    List<ChartStuff> chartsData = [
      ChartStuff(
          year: "2019",
          category: "Saúde",
          valueSpent: 300,
          color: charts.ColorUtil.fromDartColor(Colors.blue)),
      ChartStuff(
          year: "2018",
          category: "Transportes",
          valueSpent: 100,
          color: charts.ColorUtil.fromDartColor(Colors.pink)),
      ChartStuff(
        year: "2017",
        category: "Despesas",
        valueSpent: 700,
        color: charts.ColorUtil.fromDartColor(Colors.orange),
      ),
      ChartStuff(
        year: "2018",
        category: "Serviços",
        valueSpent: 800,
        color: charts.ColorUtil.fromDartColor(Colors.purple),
      ),
      ChartStuff(
        year: "2015",
        category: "Restauração",
        valueSpent: 80,
        color: charts.ColorUtil.fromDartColor(Colors.yellow),
      ),
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
        height: MediaQuery.of(context).size.height / 2.5,
        padding: EdgeInsets.fromLTRB(30, 0, 0, 50),
        //color: Colors.blue[100],
        child: charts.BarChart(
          series,
          behaviors: [
            charts.ChartTitle(
              'Gastos Mensais',
              innerPadding: 50,
              titleOutsideJustification: charts.OutsideJustification.start
            ),
          ],
        ),
      ),
    );
  }
}
