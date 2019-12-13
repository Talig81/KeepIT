import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:keep_it/Dashboard/main_dash.dart';
import 'package:keep_it/Home/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String creError = "";
  final emailCont = TextEditingController();
  final passwordCont = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return loginButtonArea();
  }

  // Scaffold e Coluna que chama os widgets
  // o resizetoavoidbottominset faz com que o teclado fique por cima das widgets
  
  // structure
  Widget loginButtonArea() => new Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                Colors.teal[100],
                Colors.teal[200],
                Colors.teal[300],
                Colors.teal[600],
              ],
            ),
          ),
          padding: EdgeInsets.only(top: 30, bottom: 20),
          child: Column(
            children: <Widget>[
              avatar(),
              fields(),
            ],
          ),
        ),
      );

  Widget fields() => Expanded(
        flex: 7,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            textoError(),
            loginButton(),
            textRegister(),
            divider(),
            fgIcons(),
          ],
        ),
      );

  Widget avatar() => Expanded(
        flex: 4,
        child: Center(
          child: Container(
              child: CircleAvatar(
                radius: 75,
                backgroundColor: Colors.white70,
                backgroundImage: AssetImage('images/mascote.png'),
              ),
              padding: const EdgeInsets.all(1.0), // borde width
              decoration: new BoxDecoration(
                color: Colors.teal[800], // border color
                shape: BoxShape.circle,
              )),
        ),
      );

  // ------------------------------ WIDGETS A SEREM USADOS ------------------------------

  // FIELDS
  Widget emailField() => new Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: new TextFormField(
          controller: emailCont,
          decoration: new InputDecoration(
            focusedBorder: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15),
              borderSide: new BorderSide(color: Colors.black, width: 1.5),
            ),
            enabledBorder: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15),
              borderSide: new BorderSide(color: Colors.teal[800], width: 1.5),
            ),
            hintText: 'Email',
            contentPadding:
                new EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            prefixIcon: const Icon(
              Icons.email,
              color: Colors.black54,
            ),
          ),
          onSaved: (String value) {},
          validator: (String value) {
            return value.contains('@') ? 'Do not use the @ char.' : null;
          },
        ),
      );

  Widget passwordField() => new Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: new TextFormField(
          obscureText: true,
          controller: passwordCont,
          decoration: new InputDecoration(
            focusedBorder: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15),
              borderSide: new BorderSide(color: Colors.black, width: 1.5),
            ),
            enabledBorder: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15),
              borderSide: new BorderSide(color: Colors.teal[800], width: 1.5),
            ),
            hintText: 'Password',
            contentPadding:
                new EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            prefixIcon: const Icon(
              Icons.vpn_key,
              color: Colors.black54,
            ),
          ),
          onSaved: (String value) {},
          validator: (String value) {
            return value.contains('@') ? 'Do not use the @ char.' : null;
          },
        ),
      );

  // DIVISOR SEPARADOR
  Widget divider() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    Colors.white10,
                    Colors.white,
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            width: 100.0,
            height: 1.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text(
              "Ou",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontFamily: "WorkSansMedium"),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    Colors.white10,
                    Colors.white,
                  ],
                  begin: const FractionalOffset(1.0, 1.0),
                  end: const FractionalOffset(0.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            width: 100.0,
            height: 1.0,
          ),
        ],
      );

  // ICONES DO FACEBOOK E GOOGLE nao funcional
  Widget fgIcons() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10.0, right: 40.0),
            child: GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: new Icon(
                  FontAwesomeIcons.facebookF,
                  color: Color(0xFF0084ff),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: new Icon(
                  FontAwesomeIcons.google,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      );

  // LOGGIN BUTTON
  Widget loginButton() => Container(
        width: 200,
        margin: EdgeInsets.only(top: 30),
        child: ButtonTheme(
          minWidth: 300,
          height: 45.0,
          child: new RaisedButton(
            color: Colors.teal[100],
            child: new Text(
              'Login',
              style: TextStyle(
                color: Colors.teal[800],
                fontSize: 20,
              ),
            ),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
              side: BorderSide(color: Colors.black),
            ),
            onPressed: () {
              doLogin(context);
            },
          ),
        ),
      );

  // Controlo de Erros
  Widget textoError() => Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Text(
          this.creError,
          style: TextStyle(color: Colors.red, fontSize: 14),
        ),
      );

  // Texto do Registar
  Widget textRegister() => new Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: new RichText(
          text: new TextSpan(
            children: [
              new TextSpan(
                text: 'Registar',
                style: new TextStyle(
                  color: Colors.teal[50],
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                recognizer: new TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.popAndPushNamed(context, '/register');
                  },
              ),
            ],
          ),
        ),
      );

  // função que trata do login
  void doLogin(BuildContext context) {
    Users c = new Users();
    c.normalLogin(this.emailCont.text, passwordCont.text).then(
      (data) {
        if (data == 200) {
          this.emailCont.clear();
          this.passwordCont.clear();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(c: c),
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
