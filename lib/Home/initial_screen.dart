import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  @override

  // Coluna que contem o logo, o botao registar e o texto de entrar aqui
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        logo(),
        buttonRegister(context),
        textLogin(context),
      ],
    );
  }

  // ---------------- WIDGETS

  Widget logo() => Center(
        child: Container(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 60),
            child: Image.asset('images/mascote.png'),
          ),
        ),
      );

  Widget buttonRegister(BuildContext context) => ButtonTheme(
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
            Navigator.popAndPushNamed(context, '/register');
          },
        ),
      );

  Widget textLogin(BuildContext context) => Container(
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
      );
}
