import 'package:flutter/material.dart';
import './home_controller.dart';

void homeScreen() => runApp(new HomeScreen());

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return homeScaffold();
  }

  Widget homeScaffold() => Scaffold(
        appBar: homeAppbar(),
        body: Container(child: HomeController(), color: Colors.green[50]),
      );

  Widget homeAppbar() => AppBar(
        backgroundColor: Colors.teal[400],
        title: Text(
          'Don\'t throw it, Keep it.',
          style: homeTextStyle(),
        ),
      );

  Widget homeText() => new Text(
        "Keep IT",
        textAlign: TextAlign.center,
        style: homeTextStyle(),
      );

  TextStyle homeTextStyle() => TextStyle(
      color: Colors.white,
        fontFamily: 'RobotoMono',
        fontSize: 25,
        wordSpacing: 7,
        fontWeight: FontWeight.bold,
        shadows: <Shadow>[
          Shadow(
            offset: Offset(5.0, 5.0),
            blurRadius: 5.0,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ],
      );
}
