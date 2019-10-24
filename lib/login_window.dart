import 'package:flutter/material.dart';

class LoginWindow extends StatefulWidget {
  @override
  _LoginWindowState createState() => _LoginWindowState();
}

class _LoginWindowState extends State<LoginWindow> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Container(
          width: 100.0,
          height: 100.0,
          padding: const EdgeInsets.all(2.0), // borde width
          decoration: new BoxDecoration(
            color: Colors.black, // border color
            shape: BoxShape.circle,
          ),
          child: new CircleAvatar(
            backgroundImage: AssetImage('images/default_avatar.png'),
            radius: 50,
            backgroundColor: Colors.tealAccent[100],
          ),
        ),
        Text(
          'Ai mi pai',
          style: new TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
