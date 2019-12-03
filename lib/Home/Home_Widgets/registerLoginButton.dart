import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterLoginButton extends StatelessWidget {
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
                minWidth: ScreenUtil.instance.setWidth(500),
                height: ScreenUtil.instance.setHeight(120.0),
                child: new RaisedButton(
                  color: Colors.teal[100],
                  child: new Text(
                    '$nameButton',
                    style: TextStyle(
                      color: Colors.teal[800],
                      fontSize: 20,
                    ),
                  ),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '$route');
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
                            Navigator.popAndPushNamed(context, '/login');
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
}
