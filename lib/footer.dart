import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:keep_it/home_controller.dart';

class Footer extends StatelessWidget {
  final HomeControllerState controllerState;

  Footer({
    @required this.controllerState,
  });

  @override
  Widget build(BuildContext context) {
    return footerContainer();
  }

  Widget footerContainer() => Container(
      height: 80,
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 0,
              child: Divider(
                color: Colors.blueGrey[300],
                thickness: 2,
              )),
          footerRow(),
        ],
      ));

  Widget footerRow() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Opacity(
            opacity: 0.5,
            child: RaisedButton(
                color: Colors.teal[100],
                child: Text(
                  'Suporte',
                  style: TextStyle(
                    color: Colors.teal[900],
                  ),
                ),
                onPressed: () {
                  this.controllerState.changeWindow(4);
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
                color: Colors.teal[100],
                onPressed: () {
                  this.controllerState.changeWindow(5);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.transparent))),
          )
        ],
      );
}
