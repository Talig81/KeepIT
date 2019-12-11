import 'package:flutter/material.dart';
import './home_controller.dart';

void homeScreen() => runApp(new HomeScreen());

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.teal[600],
            Colors.teal[300],
            Colors.teal[200],
            Colors.teal[100],
          ],
        ),
      ),
      child: HomeController(),
    );
  }
}
