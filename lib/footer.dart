import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return footerContainer(context);
  }
}

Widget footerContainer(BuildContext context) => Container(
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
              color: Colors.teal[100],
              child: Text(
                'Suporte',
                style: TextStyle(
                  color: Colors.teal[900],
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Form(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                child: Text("FAZER QQR MERDA AQUI"),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
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
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text(
                            "SOMOS A KEEPIT UMA EMPRESA DO CARALHO, METAM AQUI AS VOSSAS FARTURAS"),
                      );
                    });
              },
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.transparent))),
        )
      ],
    );
