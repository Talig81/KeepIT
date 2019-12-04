import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Receipts extends StatefulWidget {
  _Receipts createState() => _Receipts();
}

class _Receipts extends State<Receipts> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        receipts(context),
        Divider(color: Colors.teal[800])
      ],
    );
  }

  Widget receipt() => new ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        leading: Container(
          decoration: new BoxDecoration(
            border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.teal[800]),
            ),
          ),
          child: Icon(
            Icons.receipt,
            color: Colors.teal[800],
            size: 35,
          ),
        ),
        title: Text(
          "Fatura: 20/04/2019",
          style: TextStyle(
              color: Colors.teal[800],
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil.instance.setWidth(45)),
        ),
        subtitle: Row(
          children: <Widget>[
            Icon(
              Icons.euro_symbol,
              color: Colors.yellow[800],
              size: 18,
            ),
            Text(" 124 euros", style: TextStyle(color: Colors.teal[800]))
          ],
        ),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.teal[800], size: 30.0),
      );

  Widget receipts(BuildContext context) => new ListView.separated(
        //scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(20),
        //scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 4,
        separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.teal[800],),
        itemBuilder: (BuildContext context, int index) {
          return Center(
            //color: Colors.green[100],
            child: Container(
              width: MediaQuery.of(context).size.width - 100,
              height: 80,
              child: receipt(),
              ),
          );
        },
      );
}
