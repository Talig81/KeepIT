import 'package:flutter/material.dart';
import './login_windows.dart';
import './footer.dart';

class LoginController extends StatefulWidget {
  @override
  _LoginControllerState createState() => _LoginControllerState();
}

class _LoginControllerState extends State<LoginController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          LoginWindows(),
          Footer(),
        ],
      ),
    );
  }
}
