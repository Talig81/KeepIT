import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:keep_it/Dashboard/main_dash.dart';
import 'package:keep_it/Home/user.dart';

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  // Center e Container que definem a caixa do login
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 60, horizontal: 45),
        child: loginButtonArea(),
      ),
    );
  }

  // Scaffold e Coluna que chama os widgets. O padding e necessario senao fica tudo encostado a caixa
  // o resizetoavoidbottominset faz com que o teclado fique por cima das widgets. mas nao e a melhor approach porque pode ficar por cima do password field.
  Widget loginButtonArea() => new Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.green[100],
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: <Widget>[
              avatar(),
              emailField(),
              passwordField(),
              loginButton(),
            ],
          ),
        ),
      );

  // --------------------- WIDGETS A SEREM USADOS --------------

  // avatar. a margem e para nao ficar com os text fields tao em cima
  Widget avatar() => Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: CircleAvatar(
          radius: 75,
          backgroundImage: AssetImage('images/mascote.png'),
        ),
      );

  // email field
  TextFormField emailField() => new TextFormField(
        decoration:
            new InputDecoration(icon: Icon(Icons.email), labelText: 'Email'),
        onSaved: (String value) {},
        validator: (String value) {
          return value.contains('@') ? 'Do not use the @ char.' : null;
        },
      );

  // password field
  TextFormField passwordField() => new TextFormField(
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

  // butao login
  Widget loginButton() => Container(
        width: 200,
        margin: EdgeInsets.symmetric(vertical: 45),
        child: RaisedButton(
          color: Colors.teal[200],
          child: new Text(
            'Login',
            style: TextStyle(color: Colors.teal[800], fontSize: 20),
          ),
          onPressed: () {
            Users c = new Users();
            c.handleSignIn().whenComplete(
              () {
                print(c.getName());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Dashboard(c),
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
      );
}
