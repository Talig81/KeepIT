import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:keep_it/Home/Home_Widgets/registerLoginButton.dart';

import 'Home_Widgets/logo.dart';
import 'Home_Widgets/registerLoginButton.dart';

class InitialScreen extends StatelessWidget {
  @override
  //TODO: meter responsive no fontSize
  //TODO: tentar reciclar o codigo do screenUtil

  // Coluna que contem o logo, o botao registar e o texto de entrar aqui
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

    return Container(
      width: MediaQuery.of(context).size.width,
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
      child: Column(
        children: <Widget>[
          LogoKit(),
          RegisterLoginButton2().button(
            context,
            'Registar',
            '/register',
          ),
        ],
      ),
    );
  }

}
