import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_it/Dashboard/categoriesList.dart';
import 'package:keep_it/Dashboard/receipts2.dart';
import 'package:keep_it/user.dart';

import './drawer_style.dart';

class Dashboard extends StatefulWidget {
  final Users user;

  const Dashboard({Key key, this.user}) : super(key: key);
  _Dashboard createState() => _Dashboard();
}

//TODO:vai ser necessário acrescentar um widget quando tivermos ligação ao backend para saber quem é o utilizador

class _Dashboard extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'KeepIT',
          style: new TextStyle(
            fontFamily: 'RobotoMono',
            fontSize: 30,
            wordSpacing: 15,
            fontWeight: FontWeight.bold,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(5.0, 5.0),
                blurRadius: 5.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.teal[500],
      ),
      drawer: DrawerStyle(),
      body: Column(
        children: <Widget>[
          CategoriesList(),
          SizedBox(
            height: 5,
          ),
          Receipts(
            user: widget.user,
          ),
        ],
      ),
    );
  }
}
