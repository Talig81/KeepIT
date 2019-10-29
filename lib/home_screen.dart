import 'package:flutter/material.dart';
import './login_controller.dart';

void loginScreen() => runApp(new LoginScreen());

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return loginScaffold();
  }

  Widget loginScaffold() => Scaffold(
        appBar: loginAppbar(),
        body: LoginController(),
      );

  Widget loginAppbar() => AppBar(
        backgroundColor: Colors.green[300],
        title: new Center(
          child: loginText(),
        ),
      );

  Widget loginText() => new Text(
        "Keep IT",
        textAlign: TextAlign.center,
        style: loginTextStyle(),
      );

  TextStyle loginTextStyle() => TextStyle(
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
      );
}
