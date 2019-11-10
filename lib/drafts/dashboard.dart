import 'package:flutter/material.dart';

class Dashboards extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboards> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return dashScaffold();
  }

  Widget dashScaffold() => Scaffold(
        appBar: dashAppbar(),
        body: new Container(),
      );

  Widget dashAppbar() => AppBar(
        backgroundColor: Colors.green[300],
        title: new Center(
          child: dashText(),
        ),
      );

  Widget dashText() => new Text(
        "Keep IT",
        textAlign: TextAlign.center,
        style: new TextStyle(
          fontFamily: 'RobotoMono',
          fontSize: 45,
          wordSpacing: 7,
          fontWeight: FontWeight.bold,
          shadows: <Shadow>[
            Shadow(
              offset: Offset(5.0, 5.0),
              blurRadius: 5.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ],
        ),
      );
}
