import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RegisterScreen extends StatefulWidget {
  // Se aparecer alguma vez o erro de "no material widget found" é porque aplicou se text fields sem scaffold ou material app antes.
  //
  // se calhar e melhor primeiro definir o container e o center e so depois meter o scaffold. o login_screen ta direito
  _RegisterScreen createState() =>_RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen>{
@override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return registerButtonArea();
  }

Widget registerButtonArea() => new Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
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
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 100),
          child: Column(
            children: <Widget>[
              avatar(),
              SizedBox(height: 10),
              nameField(),
              SizedBox(height: 10),
              emailField(),
              SizedBox(height: 10),
              passField(),
              registerButton(),
            ],
          ),
        ),
      );

 Widget avatar() => Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: CircleAvatar(
          radius: 75,
          backgroundImage: AssetImage('images/mascote.png'),
          backgroundColor: Colors.transparent,
        ),
      );

  Container nameField() => Container(
        width: 400,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.teal[800]),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Theme(
          data: ThemeData(primaryColor: Colors.teal[900]),
          child: new TextFormField(
            cursorColor: Colors.teal[900],
            decoration: new InputDecoration(
              border: InputBorder.none,
              hintText: "Nome",
              icon: Icon(Icons.person),
              hintStyle: TextStyle(
                fontSize: 16.0,
                color: Colors.teal[900],
                inherit: false,
              ),
            ),
            onSaved: (String value) {},
            validator: (String value) {
              return value.contains('@') ? 'Do not use the @ char.' : null;
            },
          ),
        ),
      );

  Container emailField() => Container(
        width: 400,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.teal[800]),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Theme(
          data: ThemeData(primaryColor: Colors.teal[900]),
          child: new TextFormField(
            cursorColor: Colors.teal[900],
            decoration: new InputDecoration(
              border: InputBorder.none,
              hintText: "Email",
              icon: Icon(Icons.email),
              hintStyle: TextStyle(
                fontSize: 16.0,
                color: Colors.teal[900],
                inherit: false,
              ),
            ),
            onSaved: (String value) {},
            validator: (String value) {
              return value.contains('@') ? 'Do not use the @ char.' : null;
            },
          ),
        ),
      );

  Container passField() => Container(
        width: 400,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.teal[800]),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Theme(
          data: ThemeData(primaryColor: Colors.teal[900]),
          child: new TextFormField(
            cursorColor: Colors.teal[900],
            decoration: new InputDecoration(
              border: InputBorder.none,
              hintText: "Password",
              icon: Icon(Icons.vpn_key),
              hintStyle: TextStyle(
                fontSize: 16.0,
                color: Colors.teal[900],
                inherit: false,
              ),
            ),
            onSaved: (String value) {},
            validator: (String value) {
              return value.contains('@') ? 'Do not use the @ char.' : null;
            },
          ),
        ),
      );

  Column registerButton() => Column(
        children: <Widget>[
          Container(
            width: 200,
            padding: EdgeInsets.only(top: 100),
            child: new RaisedButton(
              color: Colors.teal[100],
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
          FlatButton(
            color: Colors.transparent,
            child: Text('Já tem conta?',
                style: TextStyle(
                    color: Colors.teal[900],
                    decoration: TextDecoration.underline)),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      );
}
