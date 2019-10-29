import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return homeScaffold();
  }

  Widget homeScaffold() => Scaffold(
        appBar: homeAppbar(),
        body: new Container(),
      );

  Widget homeAppbar() => AppBar(
        backgroundColor: Colors.green[300],
        title: new Center(
          child: homeText(),
        ),
      );

  Widget homeText() => new Text(
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
