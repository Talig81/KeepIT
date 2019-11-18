import 'package:flutter/material.dart';
import 'package:keep_it/Home/user.dart';

import './drawer_style.dart';

class Dashboard extends StatelessWidget {
  final Users c;

  Dashboard(this.c);

  Widget testFunc(BuildContext context) => new Container(
    child: RaisedButton(onPressed: (){
      c.handleSignOut();
      Navigator.pop(context);
    },)
  );

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text(
          'KeepIT',
          style: new TextStyle(
            fontFamily: 'RobotoMono',
            fontSize: 30,
            wordSpacing: 7,
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
        actions: <Widget>[
          testFunc(context),
        ],
        backgroundColor: Colors.teal[400],
      ),
      drawer: DrawerStyle(),
      body: new Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: receipts(context),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:  Colors.teal[400],
        elevation: 7,
        items: const <BottomNavigationBarItem>[
           
          BottomNavigationBarItem(
            icon: Icon(Icons.volume_up),
            title: Text('Pokemon'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),

          ),
        ],
      ),
    );
  }

  Widget makeListTile() => new ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child: Icon(
            Icons.receipt,
            color: Colors.white,
            size: 35,
          ),
        ),
        title: Text(
          "Fatura: 1234",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: Row(
          children: <Widget>[
            Icon(Icons.attach_money, color: Colors.yellowAccent),
            Text(" 10 paus", style: TextStyle(color: Colors.white))
          ],
        ),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      );

  Widget receipts(BuildContext context) => new ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return makeCard();
        },
      );

  Widget makeCard() => new Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          child: makeListTile(),
        ),
      );

  Widget circleImage() {
    return new Container(
      width: 100.0,
      height: 100.0,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
          fit: BoxFit.cover,
          image: new AssetImage('images/mascote.png'),
        ),
      ),
    );
  }
}
