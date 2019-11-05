import 'package:flutter/material.dart';

import './register_screen.dart';

class WindowsManager extends StatefulWidget {
  final int chosenWindow;
  WindowsManager({
    @required this.chosenWindow,
  });

  @override
  _WindowsManagerState createState() => _WindowsManagerState();
}

class _WindowsManagerState extends State<WindowsManager> {
  int loginRegister = 0;
  Widget window;

  @override
  void initState() {
    super.initState();
  }

  int changeWindow(int number) {
    return loginRegister = number;
  }

  @override
  Widget build(BuildContext context) {
    if (loginRegister == 0)
      return chooseWidget(widget.chosenWindow);
    else
      return chooseWidget(loginRegister);
  }

  Widget chooseWidget(int number) {
    switch (number) {
      case 1:
        return initialScreen();
        break;
      case 3:
        return RegisterScreen();
        break;
      default:
        return Container();
    }
  }
 

  Widget initialScreen() => Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: logo(),
          ),
          Expanded(
            flex: 1,
            child: window,
          ),
        ],
      );

  Widget logo() => Center(
        child: Container(
          color: Colors.green[50],
          alignment: Alignment.center,
          child: Image.asset('images/background_logo.png'),
        ),
      );

  Widget buttonArea() => Center(
        child: Column(
          children: <Widget>[
            buttonRegister(),
            buttonLogin(),
          ],
        ),
      );

  Widget buttonRegister() => ButtonTheme(
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
            setState(() {
              window = RegisterScreen();
            });
          }, // make state changes in a setState
        ),
      );

  Widget buttonLogin() => Container(
        margin: EdgeInsetsDirectional.only(top: 25),
        child: InkWell(
          child: new Text(
            'Iniciar sessão',
            style: TextStyle(
              fontSize: 13,
              decoration: TextDecoration.underline,
              color: Colors.teal[400],
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          onTap: () {},
        ),
      );
}
