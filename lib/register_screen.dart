import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RegisterScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return registerButtonArea();
  }

Widget registerButtonArea() => Container(
            alignment: Alignment.topCenter,
            width: 250,
            color: Colors.green[50],
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
                      'Registar',
                      style: TextStyle(color: Colors.teal[800]),
                    ),
                    onPressed: () {},
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
                  onPressed: () {},
                )
              ],
            ),
          );

}