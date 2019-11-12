import 'package:flutter/material.dart';

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
        backgroundColor: Colors.teal[400],
      ),
      drawer: DrawerStyle(),
      body: Column(
        children: <Widget>[
          categories(context),
          receipts(context),
        ],
      ),
    );
  }

  Widget categories(BuildContext context) => new Row(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top:5),
                  width: 20,
                  height: 20,
                  child: FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.blue,
                    elevation: 0,
                    onPressed: () => {},
                  ),
                ),
                Text('Categoria')
              ],
            ),
          ],
        );

  Widget receipts(BuildContext context) => new Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        constraints: BoxConstraints(maxWidth: 450, maxHeight: 300),
        // decoration: BoxDecoration(
        //   boxShadow: [
        //     BoxShadow(
        //         color: Colors.blueGrey[800],
        //         offset: Offset(12, 25.0),
        //         blurRadius: 8,
        //         spreadRadius: -35),
        //   ],
        // ),
        child: Card(
          child: ListView(
            children: <Widget>[
              Text('Ola1'),
              Text('Ola2'),
            ],
          ),
        ),
      );
}
