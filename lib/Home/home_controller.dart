import 'package:flutter/material.dart';
import 'package:keep_it/Dashboard/stats_view.dart';
import 'package:keep_it/Home/user.dart';
import '../Dashboard/main_dash.dart';
import './register_screen.dart';
import './login_screen.dart';
import './initial_screen.dart';

class HomeController extends StatefulWidget {
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  Users theuser = new Users();
  @override
  void initState() {
    super.initState();
  }

  //Rotas para as widgets
  Widget build(BuildContext context) {
    isLogged(context);
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => InitialScreen(),
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => Dashboard(usrs: this.theuser),
        '/dashboard/stats': (context) => StatsView(),
      },
    );
  }

  void isLogged(BuildContext ctx) {
    theuser.read().then((v) {
      if (v) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboard(usrs: theuser),
          ),
        );
        Navigator.pop(context);
      }
    });
  }
}
