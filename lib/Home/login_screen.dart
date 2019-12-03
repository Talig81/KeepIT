import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:keep_it/Home/Home_Widgets/logo.dart';

import 'Home_Widgets/registerLoginButton.dart';
import 'Home_Widgets/user_fields.dart';

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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    ScreenUtil.instance = ScreenUtil(
      width: 1125.0,
      height: 2436.0,
      allowFontScaling: true,
    )..init(context);

    return loginArea();
  }

  // Scaffold e Coluna que chama os widgets. O padding e necessario senao fica tudo encostado a caixa
  // o resizetoavoidbottominset faz com que o teclado fique por cima das widgets. mas nao e a melhor approach porque pode ficar por cima do password field.
  Widget loginArea() => new Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: MediaQuery.of(context).size.width,
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
          child: Column(
            children: <Widget>[
              LogoKit(),
              UserFields('Login'),
              RegisterLoginButton().button(context, 'Login', '/dashboard')
            ],
          ),
        ),
      );
}
