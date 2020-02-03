import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_it/Dashboard/pdf_viewer.dart';

class Receipts extends StatefulWidget {
  _Receipts createState() => _Receipts();
}

class _Receipts extends State<Receipts> {
  @override
  void initState() {
    super.initState();
  }

  List fatCat = [
    'Restauração',
    'Saúde',
    'Transportes',
    'Despesas',
    'Serviços',
    'Educação',
    'Outros',
    'Restauração',
    'Saúde',
    'Transportes'
  ];

  List col = [
    Colors.yellow[700],
    Colors.blue,
    Colors.pink,
    Colors.orange,
    Colors.purple,
    Colors.red,
    Colors.green,
    Colors.yellow[700],
    Colors.blue,
    Colors.pink,
  ];

  List fatDat = [
    '20/04/2019',
    '20/04/2019',
    '21/04/2019',
    '21/04/2019',
    '21/04/2019',
    '21/04/2019',
    '22/04/2019',
    '22/04/2019',
    '22/04/2019',
    '22/04/2019'
  ];

  List price = [
    '124.00',
    '0.70',
    '5.00',
    '43.25',
    '3.99',
    '54.90',
    '0.30',
    '6.99',
    '0.65',
    '10.32'
  ];

  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height / 2,
          child: receipts(context),
        ),
        Column(
          children: <Widget>[
            // Expanded(
            //   flex: 0,
            //   child: Divider(color: Colors.teal[800]),
            // ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "Ver todos",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.teal[800]),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
                padding: EdgeInsets.only(left: 155),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Total: ",
                      style: TextStyle(
                          color: Colors.teal[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "250.10€",
                      style: TextStyle(
                          color: Colors.teal[800],
                          fontWeight: FontWeight.normal,
                          fontSize: 28),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ))
          ],
        )
      ],
    );
  }

  Widget receipt(int index) => new ListTile(
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
            color: col[index],
            size: 35,
          ),
        ),
        title: Container(
          padding: EdgeInsets.only(top: 10),
          height: 55,
          //color: Colors.blue,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                fatCat[index] + ":",
                style: TextStyle(
                  color: Colors.teal[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                fatDat[index],
                style: TextStyle(
                    color: Colors.teal[800],
                    fontWeight: FontWeight.normal,
                    fontSize: 15),
              ),
            ],
          ),
        ),
        subtitle: Container(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.euro_symbol,
                color: Colors.yellow[800],
                size: 18,
              ),
              Text(
                price[index],
                style: TextStyle(
                  color: Colors.teal[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),

        trailing: FlatButton(
          onPressed: () {
            PreparePdf.prepareTestPdf1(context).then((path) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FullPdfViewerScreen(path)),
              );
            });
          }, //meter aqui a mudar a rota para poder ver a info da fatura
          child: Container(
            //color: Colors.blue,
            child: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.teal[800],
              size: 20,
            ),
          ),
        ),
      );

  Widget receipts(BuildContext context) => ListView.separated(
        physics: ClampingScrollPhysics(),
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            indent: ScreenUtil.instance.setWidth(90),
            endIndent: ScreenUtil.instance.setWidth(80),
            color: Colors.teal[800],
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return Center(
            //color: Colors.green[100],
            child: Container(
              width: MediaQuery.of(context).size.width - 100,
              height: 80,
              child: receipt(index),
            ),
          );
        },
      );
}
