import 'dart:developer';

import 'package:flutter/material.dart';
import 'Home/home_controller.dart';

class Footer extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return footerContainer(context);
  }

  Widget footerContainer(BuildContext context) => Container(
    color: Colors.teal[400],
      height: 80,
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 0,
              child: Divider(
                color: Colors.blueGrey[300],
                thickness: 2,
              )),
          footerRow(context),
        ],
      ));

  Widget footerRow(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Opacity(
            opacity: 0.5,
            child: RaisedButton(
                color: Colors.teal[50],
                child: Text(
                  'Suporte',
                  style: TextStyle(
                    color: Colors.teal[900],
                  ),
                ),
                onPressed: () {
                },
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.transparent))),
          ),
          SizedBox(
            width: 10,
          ),
          Opacity(
            opacity: 0.5,
            child: RaisedButton(
                child: Text(
                  'Sobre nós',
                  style: TextStyle(
                    color: Colors.teal[900],
                  ),
                ),
                color: Colors.teal[50],
                onPressed: () {
                  MaterialPageRoute(builder: (context) => HomeController());
                },
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.transparent))),
          )
        ],
      );
}
