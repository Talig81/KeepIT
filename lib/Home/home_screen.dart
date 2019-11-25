import 'package:flutter/material.dart';
import './home_controller.dart';
import '../footer.dart';

void homeScreen() => runApp(new HomeScreen());

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: HomeController(),
          ),
          
        ],
      ),
    );
  }
}
