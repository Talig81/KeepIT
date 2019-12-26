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
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height/2,
          child: receipts(context),
        ),
        Column(
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Divider(color: Colors.teal[800]),
            ),
            Container(
                padding: EdgeInsets.only(left: 155),
                child: Text(
                  "Total = 1234",
                  style: TextStyle(
                      color: Colors.teal[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                  textAlign: TextAlign.right,
                ))
          ],
        )
      ],
    );
  }

  Widget receipt() => new ListTile( //aqui vai ter que se meter a cena das faturas 
        contentPadding: EdgeInsets.symmetric(
          horizontal: ScreenUtil.instance.setWidth(10.0),
          vertical: ScreenUtil.instance.setHeight(4.0),
        ),
        leading: Container(
          decoration: new BoxDecoration(
            border: new Border(
              right: new BorderSide(
                  width: ScreenUtil.instance.setWidth(1.0),
                  color: Colors.teal[800]),
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
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.teal[800],
          size: ScreenUtil.instance.setWidth(50.0),
        ),
      );

  Widget receipts(BuildContext context) => ListView.separated(
          physics: ClampingScrollPhysics(),
          itemCount: 10,
          separatorBuilder: (BuildContext context, int index) => Divider(
            indent: ScreenUtil.instance.setWidth(90),
            endIndent: ScreenUtil.instance.setWidth(80),
            color: Colors.teal[800],
          ),
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

//scrollDirection: Axis.horizontal,
//new CustomScrollView(
//scrollDirection: Axis.horizontal,
//   shrinkWrap: true,
//   slivers: <Widget>[
//     SliverList(
//       delegate: SliverChildBuilderDelegate(
//         (BuildContext context, int index) {
//           return Container(
//             alignment: Alignment.center,
//             padding: EdgeInsets.all(
//               ScreenUtil.instance.setWidth(20),
//             ),
//             //color: Colors.teal[100 * (index % 9)],
//             child: IndexedSemantics(index: 0, child: receipt()),
//           );
//         },
//         childCount: 5,
//       ),
//     ),
//   ],
// );
