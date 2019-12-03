import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:keep_it/Home/Home_Widgets/logo.dart';
import 'package:keep_it/Home/Home_Widgets/user_fields.dart';

import 'Home_Widgets/registerLoginButton.dart';

class RegisterScreen extends StatefulWidget {
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
  }

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

    return registerButtonArea();
  }

  Widget registerButtonArea() => new Scaffold(
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
              UserFields('Registar'),
              RegisterLoginButton().button(context, 'Registar', '/'),
            ],
          ),
        ),
      );
}
