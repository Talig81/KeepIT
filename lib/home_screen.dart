import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import './home_controller.dart';

void homeScreen() => runApp(new HomeScreen());

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                // Box decoration takes a gradient
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.1, 0.3, 0.7, 0.9],
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.
                    Colors.teal[700],
                    Colors.teal[600],
                    Colors.teal[500],
                    Colors.teal[400],
                  ],
                ),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 18,
                    child: loginController(),
                  ),
                  Expanded(flex: 1, child: footerRow()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget homeAppbar() => AppBar(
        backgroundColor: Colors.teal[400],
        title: Text(
          '       Keep it.',
          style: homeTextStyle(),
        ),
      );

  Widget homeText() => new Text(
        "Keep IT",
        textAlign: TextAlign.center,
        style: homeTextStyle(),
      );

  Widget loginController() => new Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 60, horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Center(
                            child: Image.asset('images/background_logo.png'),
                          ),
                          Divider(
                            color: Colors.blueGrey[300],
                            thickness: 4,
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsetsDirectional.only(bottom: 20),
                                width: 150,
                                padding: EdgeInsets.only(top: 50),
                                child: RaisedButton(
                                  color: Colors.teal[200],
                                  child: new Text(
                                    'Registar',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.teal[800]),
                                  ),
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.transparent)),
                                ),
                              ),
                              Container(
                                margin: EdgeInsetsDirectional.only(bottom: 15),
                                child: new RichText(
                                  text: new TextSpan(
                                    children: [
                                      new TextSpan(
                                        text: 'Já tem conta? ',
                                        style: new TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      new TextSpan(
                                        text: 'Entrar aqui',
                                        style: new TextStyle(
                                            color: Colors.blue,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                        recognizer: new TapGestureRecognizer()
                                          ..onTap = () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                        ),
                    );

  Widget footerRow() => new Row(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                PopupMenuButton(
                icon: Icon(Icons.announcement),
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text("Aqui Metemos cenas",),
                      ),
                      
                      
                    ],
              ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  iconSize: 1,
                  icon: new Image.asset('images/portugal.png'),
                  color: Colors.red,
                  onPressed: () {
                    print("olaa");
                  },
                ),
                IconButton(
                  icon: new Image.asset('images/england.png'),
                  color: Colors.red,
                  onPressed: () {
                    print("olaa");
                  },
                ),
              ],
            ),
          ),
        ],
      );

  TextStyle homeTextStyle() => TextStyle(
        color: Colors.white,
        fontFamily: 'RobotoMono',
        fontSize: 27,
        wordSpacing: 3,
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
