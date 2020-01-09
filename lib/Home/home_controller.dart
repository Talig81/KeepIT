import 'package:flutter/material.dart';
import 'package:keep_it/Dashboard/stats_view.dart';
import '../Dashboard/main_dash.dart';

import './register_screen.dart';
import './login_screen.dart';
import './initial_screen.dart';

class HomeController extends StatefulWidget {
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  @override
  void initState() {
    super.initState();
  }

  //Rotas para as widgets

  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => InitialScreen(),
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => Dashboard(),
        '/dashboard/stats': (context) => StatsView(),
      },
    );
  }
}
