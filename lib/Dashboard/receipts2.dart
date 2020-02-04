import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_it/Dashboard/pdf_viewer.dart';
import 'package:keep_it/Home/user.dart';

class Receipts extends StatefulWidget {
  final Users usrs;

  const Receipts({Key key, this.usrs}) : super(key: key);
  _Receipts createState() => _Receipts();
}

class _Receipts extends State<Receipts> {
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
  List fatDat = [];
  List price = [];
  List fatCat = [];
  var stuff = 0;
  @override
  void initState() {
    getFaturas().then((v) {
      print("done0");
    });
    super.initState();
  }

  Future<String> getFaturas() async {
    print("entren as faturas");
    final stuffas = await widget.usrs.getFaturasDifferent().then((v) {
      print("V " + widget.usrs.receitas.toString());
      widget.usrs.receitas.forEach((elem) => {
            print("entrei"),
            this.fatDat.add(elem.date),
            this.price.add(elem.price),
            this.fatCat.add(elem.category)
          });
      this.setState(() {
        print(this.fatCat);
        this.stuff = 1;
      });
      return "stuff";
    });
  }

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
                      widget.usrs.total.toString()==null ?  "0":widget.usrs.total.toString() + "€",
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
        itemCount: this.fatDat.length,
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
