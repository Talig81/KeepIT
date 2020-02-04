import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'coisas.dart';

class StatsPieChart extends StatefulWidget {
  _StatsPieChart createState() => _StatsPieChart();
}

class _StatsPieChart extends State<StatsPieChart> {
  @override
  void initState() {
    super.initState();
  }

  final List<ChartStuff> chartsData;

  _StatsPieChart({this.chartsData});

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
        padding: EdgeInsets.fromLTRB(50, 0, 0, 70),
        //color: Colors.blue[100],
        child: charts.PieChart(
          series,
          behaviors: [
            charts.ChartTitle(
              'Total Gasto por Categoria',
              innerPadding: 45,
              titleOutsideJustification: charts.OutsideJustification.start
            ),
            charts.DatumLegend(
              position: charts.BehaviorPosition.bottom,
              cellPadding: new EdgeInsets.only(
                right: 3.0,
                bottom: 3.0,
                top: .0
              ),
              desiredMaxColumns: 2,
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
