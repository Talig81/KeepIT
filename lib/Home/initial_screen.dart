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
          padding: EdgeInsets.only(top: 120, bottom: 80),
          alignment: Alignment.center,
          child: SizedBox(
            width: 350,
            child: Image.asset(
              'images/mascote.png',
            ),
          ),
        ),
      );

  Widget buttonRegister(BuildContext context) => ButtonTheme(
        minWidth: 200,
        height: 45.0,
        child: new RaisedButton(
          color: Colors.teal[200],
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
      );

  Widget textLogin(BuildContext context) => Container(
        margin: EdgeInsets.only(bottom: 150),
        child: new RichText(
          text: new TextSpan(
            children: [
              new TextSpan(
                text: 'Já tem conta? ',
                style: new TextStyle(
                    color: Colors.teal[900],
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              new TextSpan(
                text: 'Entrar aqui',
                style: new TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.teal[600],
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
