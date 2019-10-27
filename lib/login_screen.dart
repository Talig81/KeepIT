import 'package:flutter/material.dart';
import 'package:keep_it/login_window.dart';
import 'package:country_icons/country_icons.dart';

void loginScreen() => runApp(new LoginScreen());
Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85.0),
        child: AppBar(
          backgroundColor: Color.fromRGBO(2, 72, 61, 50),
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
        decoration: BoxDecoration(color: Color.fromRGBO(252, 252, 226, 10)),
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsetsDirectional.only(top: 30),
                child: Image.asset('images/logo_keep.png'),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsetsDirectional.only(top: 60),
                    height: 230.0,
                    child: Column(
                      children: <Widget>[
                        ButtonTheme(
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
                            onPressed:
                                () {}, // make state changes in a setState
                          ),
                        ),
                        Container(
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
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 182,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                ButtonTheme(
                                  minWidth: 50.0,
                                  height: 20.0,
                                  child: new RaisedButton(
                                    color: Colors.green[300],
                                    child: new Text(
                                      'Suporte',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    textColor: Colors.white,
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(28.0),
                                    ),
                                    onPressed:
                                        () {}, // make state changes in a setState
                                  ),
                                ),
                                ButtonTheme(
                                  minWidth: 50.0,
                                  height: 20.0,
                                  child: new RaisedButton(
                                    color: Colors.green[300],
                                    child: new Text(
                                      'About',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    textColor: Colors.white,
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(28.0),
                                    ),
                                    onPressed:
                                        () {}, // make state changes in a setState
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                IconButton(
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
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
