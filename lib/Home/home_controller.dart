import 'package:flutter/material.dart';

import './register_screen.dart';
import './login_screen.dart';
import '../initial_screen.dart';

class HomeController extends StatefulWidget {
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Rotinhas',
      initialRoute: '/',
      routes: {
        '/' : (context) => InitialScreen(),
        '/register' : (context) => RegisterScreen(),
        '/login' : (context) => LoginScreen(),

      },
    );
  }
}
