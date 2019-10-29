import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return footerContainer();
  }

  Widget footerContainer() => Container(
      height: 100,
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
                onPressed: () {},
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
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.transparent))),
          )
        ],
      );
}

//       child: Row(
//         children: <Widget>[
//           footerButtons(),
//           footerLanguage(),
//         ],
//       ),
//     );

// Widget footerButtons() => Row();
// Widget footerLanguage() => Row();
