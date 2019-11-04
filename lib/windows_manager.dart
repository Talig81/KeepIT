import 'package:flutter/material.dart';

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
      case 2:
        return loginScreen();
        break;
      case 3:
        return registerScreen();
        break;
      case 4:
        return suporteScreen();
        break;
      case 5:
        return aboutScreen();
        break;
      default:
        return Container();
    }
  }

  Widget registerScreen() => Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          color: Colors.grey[300],
          margin: new EdgeInsets.symmetric(horizontal: 40.0, vertical: 40),
          child: new Column(
            children: <Widget>[
              avatar(),
              inputArea(),
            ],
          ),
        ),
      );
  Widget suporteScreen() => Container();
  Widget aboutScreen() => Container();

  Widget inputArea() => Center(
        child: Column(
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(labelText: 'Email'),
              //onChanged: TODO: ver se é isto, se for, meter a tirar o footer quando se escreve nos campos
            ),
            new TextField(
                decoration: new InputDecoration(labelText: 'Password'),
                obscureText: true),
            SizedBox(height: 30),
            Container(
              width: 200,
              child: new RaisedButton(
                color: Colors.teal[200],
                child: new Text(
                  'Login',
                  style: TextStyle(color: Colors.teal[800]),
                ),
                onPressed: () {
                  this.setState(() {
                    this.changeWindow(1);
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            FlatButton(
              color: Colors.transparent,
              child: Text('Não tem conta? Registe-se aqui',
                  style: TextStyle(
                      color: Colors.teal[400],
                      decoration: TextDecoration.underline)),
              onPressed: () {},
            ),
          ],
        ),
      );
  Widget avatar() => CircleAvatar(
        backgroundColor: Colors.amberAccent[200],
        radius: 70,
        child: Image.asset('images/mascote_vector.png'),
      );

  Widget loginScreen() => Center(
        child: Container(
          alignment: Alignment.center,
          color: Colors.amberAccent[200],
          height: 200,
          width: 200,
          child: Column(
            children: <Widget>[
              Container(child: Text("ola")),
              Container(child: Text("ole")),
            ],
          ),
        ),
      );

  Widget initialScreen() => Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: logo(),
          ),
          Expanded(
            flex: 1,
            child: buttonArea(),
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
          color: Colors.green[300],
          child: new Text(
            'Registar',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          textColor: Colors.white,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0),
          ),
          onPressed: () {
            this.setState(() {
              this.changeWindow(3);
            });
          }, // make state changes in a setState
        ),
      );

  Widget buttonLogin() => Container(
        margin: EdgeInsetsDirectional.only(top: 25),
        child: InkWell(
          child: new Text(
            'Entrar',
            style: TextStyle(
              fontSize: 13,
              decoration: TextDecoration.underline,
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          onTap: () {},
        ),
      );
}
