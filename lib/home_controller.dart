import 'package:flutter/material.dart';
import './home_windows.dart';
import './footer.dart';

class HomeController extends StatefulWidget {
  final int windowChooser;
  HomeController({
    @required this.windowChooser,
  });
  @override
  HomeControllerState createState() => HomeControllerState();
}

class HomeControllerState extends State<HomeController> {
  int auxWindow = 1;
  
  @override
  void initState() {
    super.initState();
  }


  void changeWindow(int cenas){
    this.setState((){
      this.auxWindow = cenas;
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          HomeWindows(chooseWindow: auxWindow, myState: this,),
          Footer(controllerState: this,),
        ],
    );
  }
}
