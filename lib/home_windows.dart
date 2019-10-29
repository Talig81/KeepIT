import 'package:flutter/material.dart';

class HomeWindows extends StatefulWidget {
  @override
  _HomeWindowsState createState() => _HomeWindowsState();
}

class _HomeWindowsState extends State<HomeWindows> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget logo() => Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.center,
            child: Image.asset('images/default_avatar.png'),
          ),
        );

    Widget buttonArea() => Expanded(
          flex: 2,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
                width: 200,
                child: new RaisedButton(
                    color: Colors.teal[200],
                    child: new Text(
                      'Registar',
                      style: TextStyle(color: Colors.teal[800], fontSize: 25),
                    ),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.transparent))),
              ),
              SizedBox(
                height: 80,
                width: 200,
                child: FlatButton(
                  color: Colors.transparent,
                  child: Text('Login',
                      style: TextStyle(
                          color: Colors.teal[400],
                          fontSize: 25,
                          decoration: TextDecoration.underline)),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        );

    return Expanded(
      child: Column(
        children: <Widget>[
          logo(),
          buttonArea(),
        ],
      ),
    );
  }
}
