import 'package:flutter/material.dart';
import './home_windows.dart';
import './footer.dart';

class HomeController extends StatefulWidget {
  final int windowChooser;
  HomeController({
    @required this.windowChooser,
  });
  @override
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int auxWindow = widget.windowChooser;
    return Column(
        children: <Widget>[
          HomeWindows(chooseWindow: auxWindow,),
          Footer(),
        ],
    );
  }
}
