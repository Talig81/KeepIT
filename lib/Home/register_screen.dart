import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
  
class RegisterScreen extends StatelessWidget {
  // Se aparecer alguma vez o erro de "no material widget found" é porque aplicou se text fields sem scaffold ou material app antes.
  //
  // se calhar e melhor primeiro definir o container e o center e so depois meter o scaffold. o login_screen ta direito

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 50, horizontal: 45),
        child: registerButtonArea(context),
      ),
    );
  }

  //a cor do container e aqui
  Widget registerButtonArea(BuildContext context) => new Scaffold(
        backgroundColor: Colors.green[100],
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 80, horizontal: 15),
          child: Column(
            children: <Widget>[
              Theme(
                data: ThemeData(primaryColor: Colors.teal[700]),
                child: new TextField(
                  cursorColor: Colors.teal[700],
                  style: TextStyle(color: Colors.teal[800]),
                  decoration: new InputDecoration(
                    labelText: 'Nome',
                    labelStyle: TextStyle(color: Colors.teal[700]),
                  ),
                ),
              ),
              Theme(
                data: ThemeData(primaryColor: Colors.teal[700]),
                child: new TextField(
                  cursorColor: Colors.teal[700],
                  style: TextStyle(color: Colors.teal[400]),
                  decoration: new InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.teal[800],
                    ),
                  ),
                ),
              ),
              Theme(
                data: ThemeData(primaryColor: Colors.teal[700]),
                child: new TextField(
                    cursorColor: Colors.teal[700],
                    style: TextStyle(color: Colors.teal[400]),
                    decoration: new InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.teal[800]),
                    ),
                    obscureText: true),
              ),
              SizedBox(height: 30),
              Container(
                width: 200,
                padding: EdgeInsets.only(top: 100),
                child: new RaisedButton(
                  color: Colors.teal[200],
                  child: new Text(
                    'Registar',
                    style: TextStyle(color: Colors.teal[800]),
                  ),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/');
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
                child: Text('Já tem conta?',
                    style: TextStyle(
                        color: Colors.teal[400],
                        decoration: TextDecoration.underline)),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ],
          ),
        ),
      );
}
