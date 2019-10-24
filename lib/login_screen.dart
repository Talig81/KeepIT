import 'package:flutter/material.dart';
import 'package:keep_it/login_window.dart';

void loginScreen() => runApp(new LoginScreen());

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85.0),
        child: AppBar(
          backgroundColor: Colors.green[300],
          title: new Center(
            child: new Text(
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
            ),
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Container(
            alignment: FractionalOffset(0.5, 0.5),
            width: 350,
            padding: const EdgeInsets.all(20.0),
            height: 450,
            color: Colors.green[100],
            child: Center(
              child: LoginWindow(),
            ),
          ),
        ),
      ),
    );
  }
}
