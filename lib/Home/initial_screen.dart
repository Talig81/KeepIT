import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 160,
      height: 45.0,
      child: new RaisedButton(
        color: Colors.teal[300],
        child: new Text(
          'Registar',
          style: TextStyle(
            color: Colors.teal[800],
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        textColor: Colors.white,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(15.0),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        }, // make state changes in a setState
      ),
    );
  }
}
