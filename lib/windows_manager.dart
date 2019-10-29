 import 'package:flutter/material.dart';

 class WindowsManager extends StatefulWidget {
  final int chosenWindow;
  WindowsManager({
    @required this.chosenWindow,
  });

  @override
  _WindowsManagerState createState() => _WindowsManagerState();
}
 
 class _WindowsManagerState extends State<WindowsManager> {

  @override
  void initState() {
    super.initState();
  }
  int ola = 2;
 @override
  Widget build(BuildContext context) {
  
    return chooseWidget(ola, context);
  }
 Widget chooseWidget(int number, BuildContext context){
    if(number==2) return firstScreen(context);
    else return secondScreen();
  }

  Widget secondScreen() => Center(child: Container(
    child: Column(children: <Widget>[
      Container(child: Text("ola")),
      Container(child: Text("ole")),
    ],),
  ),);

  Widget firstScreen(BuildContext context) => Column(
    children: <Widget>[
      logo(),
      buttonArea(context),
    ],
  );

  Widget buttonArea(BuildContext context) => Expanded(
        flex: 2,
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                color: Colors.teal[200],
                child: new Text(
                  'Login',
                  style: TextStyle(color: Colors.teal[800]),
                ),
                onPressed: () {
                  setState(() {
                    ola = 1;
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.transparent)),
              ),
            ],
          ),
        ),
      );
  Widget logo() => Expanded(
        flex: 3,
        child: Container(
          color: Colors.green[50],
        ),
      );
}
