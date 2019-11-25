import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:keep_it/Dashboard/main_dash.dart';
import 'package:keep_it/Home/user.dart';

class RegisterScreen extends StatefulWidget {
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>{
  TextEditingController nameCont = new TextEditingController();
  TextEditingController emailCont = new TextEditingController();
  TextEditingController passwordCont = new TextEditingController();

@override
  void initState() {
    super.initState();
  }

  
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 50, horizontal: 45),
        child: registerButtonArea(context),
      ),
    );
  }

  Widget registerButtonArea(BuildContext context) => new Scaffold(
        backgroundColor: Colors.green[100],
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 15),
          child: Column(
            children: <Widget>[
              nomeField(),
              emailField(),
              passwordField(),
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
                    Users c = new Users();
                    c
                        .normalRegister(
                            emailCont.text, passwordCont.text, nameCont.text)
                        .then(
                      (onValue) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Dashboard(c: c),
                          ),
                        );
                      },
                    );
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

  // name field
  TextFormField nomeField() => new TextFormField(
        controller: nameCont,
        decoration:
            new InputDecoration(icon: Icon(Icons.contacts), labelText: 'Name'),
        onSaved: (String value) {},
        validator: (String value) {
          return value.contains('@') ? 'Do not use the @ char.' : null;
        },
      );
  // email field
  TextFormField emailField() => new TextFormField(
        controller: emailCont,
        decoration:
            new InputDecoration(icon: Icon(Icons.email), labelText: 'Email'),
        onSaved: (String value) {},
        validator: (String value) {
          return value.contains('@') ? 'Do not use the @ char.' : null;
        },
      );

  // password field
  TextFormField passwordField() => new TextFormField(
        controller: passwordCont,
        decoration: new InputDecoration(
            icon: Icon(Icons.vpn_key), labelText: 'Password'),
        onSaved: (String value) {
          // This optional block of code can be used to run
          // code when the user saves the form.
        },
        validator: (String value) {
          return value.contains('@') ? 'Do not use the @ char.' : null;
        },
      );
}
