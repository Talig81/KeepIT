import 'package:flutter/material.dart';
import './home_controller.dart';
import '../footer.dart';

void homeScreen() => runApp(new HomeScreen());

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[50],
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: HomeController(),
          ),
          Expanded(
            flex: 1,
            child: Footer(),
          ),
        ],
      ),
    );
  }
}
