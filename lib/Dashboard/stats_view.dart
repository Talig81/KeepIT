import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'categoriesList.dart';
import 'drawer_style.dart';


class StatsView extends StatefulWidget {
  _StatsView createState() => _StatsView();
}

class _StatsView extends State<StatsView> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context){
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
        ],
      ),
    );
  }
}