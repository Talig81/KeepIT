import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_it/Dashboard/main_dash.dart';
import 'package:keep_it/user.dart';

class RegisterLoginButton extends StatefulWidget {
  RegisterLoginButton2 createState() => RegisterLoginButton2();
}

class RegisterLoginButton2 extends State<RegisterLoginButton> {
  int _invalidMail = 0;
  String creError = "";
  final emailCont = TextEditingController();
  final passwordCont = TextEditingController();
  final nameCont = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    String nameButton, route;
    return button(context, nameButton, route);
  }

  Widget button(BuildContext context, String nameButton, String route) =>
      new Flexible(
        child: Container(
          padding: EdgeInsets.only(
            top: ScreenUtil.instance.setWidth(200.0),
            bottom: ScreenUtil.instance.setWidth(100),
          ),
          child: Column(
            children: <Widget>[
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width / 2.5,
                height: ScreenUtil.instance.setHeight(120.0),
                child: new RaisedButton(
                  color: Colors.teal[100],
                  child: new Text(
                    nameButton,
                    style: TextStyle(
                      color: Colors.teal[800],
                      fontSize: 20,
                    ),
                  ),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  onPressed: () {
                    Navigator.popAndPushNamed(context,
                        route); //-------------REGISTAR--------------------
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin:
                    EdgeInsets.only(bottom: ScreenUtil.instance.setWidth(150)),
                child: new RichText(
                  text: new TextSpan(
                    children: [
                      new TextSpan(
                        text: 'Já tem conta? ',
                        style: new TextStyle(
                          color: Colors.teal[900],
                          fontSize: 15,
                        ),
                      ),
                      new TextSpan(
                        text: 'Entrar aqui',
                        style: new TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.teal[900],
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            //------------------Navigator.popAndPushNamed(context, '/login');
                            Users user = new Users();
                            user.normalLogin("teste", "teste").then(
                              (onValue) {
                                print(user.token);
                                switch (onValue) {
                                  
                                  case 200:
                                  print("fiz o teste teste");
                                  
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Dashboard(user: user),
                                      ),
                                    );
                                    break;
                                  case 401:
                                    setState(() {
                                      _invalidMail = 1;
                                    });
                                    break;

                                  default:
                                }
                              },
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  void login(BuildContext context) {
    Users user = new Users();
    user.normalLogin(emailCont.text, passwordCont.text).then(
      (data) {
        if (data == 200) {
          this.emailCont.clear();
          this.passwordCont.clear();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(user: user),
            ),
          );
          setState(
            () {
              creError = "";
            },
          );
        } else {
          setState(
            () {
              creError = "Password Errada";
            },
          );
        }
      },
    ).catchError(
      (f) {
        setState(
          () {
            creError = "Servidor em baixo";
          },
        );
      },
    );
  }
}
