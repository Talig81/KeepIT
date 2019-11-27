import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InitialScreenLandscape extends StatelessWidget {
  @override

  //TODO: meter responsive no fontSize
  //TODO: tentar reciclar o codigo do screenUtil

  // Coluna que contem o logo, o botao registar e o texto de entrar aqui
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 1125.0,
      height: 2436.0,
      allowFontScaling: true,
    )..init(context);

    return Container(
      decoration: BoxDecoration(
        // Box decoration takes a gradient
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Colors.teal[100],
            Colors.teal[200],
            Colors.teal[300],
            Colors.teal[600],
          ],
        ),
      ),
      child: Column(
        children: <Widget>[
          logo(),
          buttonRegister(context),
          textLogin(context),
        ],
      ),
    );
  }

  // ---------------- WIDGETS

  Widget logo() => Flexible(
        child: Container(
          padding: EdgeInsets.only(
            top: ScreenUtil.instance.setHeight(100.0),
            //bottom: ScreenUtil.instance.setWidth(20),
          ),
          //alignment: Alignment.center,
          child: SizedBox(
            width: ScreenUtil.instance.setWidth(600.0),
            height: ScreenUtil.instance.setHeight(700),
            child: Image.asset(
              'images/mascote.png',
            ),
          ),
        ),
      );

  Widget buttonRegister(BuildContext context) => Flexible(
        child: Container(
          padding: EdgeInsets.only(
            top: ScreenUtil.instance.setWidth(100.0),
          ),
          child: ButtonTheme(
            minWidth: ScreenUtil.instance.setWidth(500),
            height: ScreenUtil.instance.setHeight(200.0),
            child: new RaisedButton(
              color: Colors.teal[100],
              child: new Text(
                'Registar',
                style: TextStyle(
                  color: Colors.teal[800],
                  fontSize: 23,
                ),
              ),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0),
              ),
              onPressed: () {
                Navigator.popAndPushNamed(context, '/register');
              },
            ),
          ),
        ),
      );

  Widget textLogin(BuildContext context) => Flexible(
        child: Container(
          margin: EdgeInsets.only(bottom: ScreenUtil.instance.setWidth(150)),
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
      );
}
