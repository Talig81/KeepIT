import 'package:flutter/material.dart';
import 'package:keep_it/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keep IT v0.0',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}
