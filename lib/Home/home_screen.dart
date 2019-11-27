import 'package:flutter/material.dart';
import './home_controller.dart';

void homeScreen() => runApp(new HomeScreen());

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.teal[100],
              Colors.teal[200],
              Colors.teal[300],
              Colors.teal[600],
            ],
          ),
        ),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: HomeController(),
          ),
        ],
      ),
    );
  }
}
