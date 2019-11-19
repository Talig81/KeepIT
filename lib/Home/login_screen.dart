import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  //TODO: ver porque quando mudo width na password muda a width do container 

  // Center e Container que definem a caixa do login
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 1100.0,
      height: 1800.0,
      allowFontScaling: true,
    )..init(context);

    return loginButtonArea();
  }

  // Scaffold e Coluna que chama os widgets. O padding e necessario senao fica tudo encostado a caixa
  // o resizetoavoidbottominset faz com que o teclado fique por cima das widgets. mas nao e a melhor approach porque pode ficar por cima do password field.
  Widget loginButtonArea() => new Scaffold(
        //resizeToAvoidBottomInset: false,
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
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil.instance.setWidth(15),
            vertical: ScreenUtil.instance.setHeight(100),
          ),
          child: Column(
            children: <Widget>[
              avatar(),
              emailField(),
              SizedBox(
                height: ScreenUtil.instance.setHeight(10),
              ),
              passwordField(),
              loginButton(),
            ],
          ),
        ),
      );

  // --------------------- WIDGETS A SEREM USADOS --------------

  // avatar. a margem e para nao ficar com os text fields tao em cima
  Widget avatar() => Container(
        width: ScreenUtil.instance.setWidth(600),
        height: ScreenUtil.instance.setHeight(700),
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          top: ScreenUtil.instance.setWidth(50),
        ),
        child: Image.asset(
          'images/mascote.png',
        ),
      );

  // email field
  Container emailField() => Container(
        // width: ScreenUtil.instance.setWidth(700),
        // height: ScreenUtil.instance.setHeight(50),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.teal[800]),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: new TextFormField(
          decoration: new InputDecoration(
            border: InputBorder.none,
            icon: Icon(Icons.email),
            hintText: "Email",
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
      );

  // password field
  Container passwordField() => Container(
        //width: ScreenUtil.instance.setWidth(300),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.teal[800]),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: new TextFormField(
          decoration: new InputDecoration(
            border: InputBorder.none,
            icon: Icon(Icons.vpn_key),
            hintText: "Password",
            hintStyle: TextStyle(
              fontSize: 16.0,
              color: Colors.teal[900],
              inherit: false,
            ),
          ),
          onSaved: (String value) {
            // This optional block of code can be used to run
            // code when the user saves the form.
          },
          validator: (String value) {
            return value.contains('@') ? 'Do not use the @ char.' : null;
          },
        ),
      );

  // butao login
  Widget loginButton() => Container(
        padding: EdgeInsets.only(
          top: ScreenUtil.instance.setWidth(300),
        ),
        child: Column(
          children: [
            Container(
              width: ScreenUtil.instance.setWidth(400),
              child: RaisedButton(
                color: Colors.teal[100],
                child: new Text(
                  'Login',
                  style: TextStyle(color: Colors.teal[800], fontSize: 20),
                ),
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/dashboard');
                },
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
            FlatButton(
              color: Colors.transparent,
              child: Text('Registe-se aqui',
                  style: TextStyle(
                      color: Colors.teal[900],
                      decoration: TextDecoration.underline)),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
      );
}
