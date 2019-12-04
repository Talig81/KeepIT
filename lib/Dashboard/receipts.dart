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
    return receipts(context);
  }

  Widget receipt() => new ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
        leading: Container(
          decoration: new BoxDecoration(
            border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white24),
            ),
          ),
          child: Icon(
            Icons.receipt,
            color: Colors.white,
            size: 35,
          ),
        ),
        title: Text(
          "Fatura: 20/04/2019",
          style: TextStyle(
              color: Colors.white,
              //fontWeight: FontWeight.bold,
              fontSize: ScreenUtil.instance.setWidth(45)),
        ),
        subtitle: Row(
          children: <Widget>[
            Icon(
              Icons.euro_symbol,
              color: Colors.yellowAccent,
              size: 18,
            ),
            Text(" 124 euros", style: TextStyle(color: Colors.white))
          ],
        ),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      );

  Widget receipts(BuildContext context) => new ListView.separated(
        //scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(20),
        //scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 3,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 15,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Center(
            //color: Colors.green[100],
            child: Container(
              width: MediaQuery.of(context).size.width - 100,
              height: 80,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    spreadRadius: 0.5,
                    blurRadius: 8,
                    offset: Offset(5, 7),
                  ),
                ],
                color: Colors.teal[800],
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: receipt(),
            ),
          );
        },
      );
}
