import 'package:flutter/material.dart';

class HomeWindows extends StatefulWidget {
  @override
  _HomeWindowsState createState() => _HomeWindowsState();
}

class _HomeWindowsState extends State<HomeWindows> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget logo() => Expanded(
          flex: 3,
          child: Container(
            color: Colors.green[50],
          ),
        );

    Widget buttonArea() => Expanded(
          flex: 2,
          child: Container(
            color: Colors.green[50],
          ),
        );

    return Expanded(
      child: Column(
        children: <Widget>[
          logo(),
          buttonArea(),
        ],
      ),
    );
  }
}
