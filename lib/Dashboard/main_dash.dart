import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_it/Dashboard/receipts.dart';

import 'categories.dart';

import './drawer_style.dart';

class Dashboard extends StatefulWidget {
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

    ScreenUtil.instance = ScreenUtil(
      width: 1125.0,
      height: 2436.0,
      allowFontScaling: true,
    )..init(context);

    return Scaffold(
      backgroundColor: Colors.green[100],
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
        backgroundColor: Colors.teal[800],
      ),
      drawer: DrawerStyle(),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Categories().categories(Colors.blue, '1'), //numero da categoria tambem serve como tag para distinguir os botoes
              SizedBox(width: 10),
              Categories().categories(Colors.pink, '2'),
              SizedBox(width: 10),
              Categories().categories(Colors.yellow, '3'),
              SizedBox(width: 10),
              Categories().categories(Colors.green, '4'),
            ],
          ),
           SizedBox(
            height: ScreenUtil.instance.setHeight(50),
          ),
          Receipts(),
        ],
      ),
    );
  }
}
