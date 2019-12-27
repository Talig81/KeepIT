import 'package:flutter/material.dart';
import 'package:keep_it/Dashboard/main_dash.dart';
import 'package:keep_it/Home/home_controller.dart';
import 'package:keep_it/Home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keep IT v0.0',
      //initialRoute: '/',
      home: HomeScreen(),
    );
  }
}
