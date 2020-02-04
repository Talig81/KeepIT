import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:keep_it/Dashboard/main_dash.dart';
import 'package:keep_it/Home/user.dart';

class InitialScreen extends StatelessWidget {
  void _aux(BuildContext ctx) {
    Users c = new Users();
    c.read().then((v) {
      if (v) {
        Navigator.push(
          ctx,
          MaterialPageRoute(
            builder: (context) => Dashboard(usrs: c),
          ),
        );
      }
    });
  }

  // Coluna que contem o logo, o botao registar e o texto de entrar aqui
  @override
  Widget build(BuildContext context) {
    _aux(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        logo(),
        buttonRegister(context),
        textLogin(context),
      ],
    );
  }

  // ---------------- WIDGETS------------------------

  Widget logo() => Center(
        child: Container(
          
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 60),
          alignment: Alignment.center,
          child: Image.asset(
            'images/mascote.png',
          ),
        ),
      );

  Widget buttonRegister(BuildContext context) => ButtonTheme(
        minWidth: 200,
        height: 45.0,
        splashColor: Colors.white,
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
            side: BorderSide(color: Colors.black45),
          ),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/register');
          },
        ),
      );

  Widget textLogin(BuildContext context) => Container(
        margin: EdgeInsets.only(bottom: 60),
        child: new RichText(
          text: new TextSpan(
            children: [
              new TextSpan(
                text: 'Já tem conta? ',
                style: new TextStyle(
                  color: Colors.teal[900],
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              new TextSpan(
                text: 'Entrar aqui',
                style: new TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.teal[600],
                    fontSize: 18,
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
