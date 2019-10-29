import 'package:flutter/material.dart';

import 'package:keep_it/windows_manager.dart';
import './home_controller.dart';



class HomeWindows extends StatefulWidget {
  final int chooseWindow;
  final State<HomeController> myState;
  HomeWindows({
    @required this.chooseWindow,
    @required this.myState,
  });

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
    switch (widget.chooseWindow) {
      case 1:
        return Expanded(
          child: WindowsManager(
            chosenWindow: 1,
          ),
        );
        break;
      case 2:
        return Expanded(
          child: WindowsManager(
            chosenWindow: 2,
          ),
        );
        break;
        case 3:
        return Expanded(
          child: WindowsManager(
            chosenWindow: 3,
          ),
        );
        break;
        case 4:
        return Expanded(
          child: WindowsManager(
            chosenWindow: 4,
          ),
        );
        case 5:
        return Expanded(
          child: WindowsManager(
            chosenWindow: 5,
          ),
        );
        break;
      default:
        return Expanded(
          child: Container(
            child: Text("asdfasdfasdfasdf"),
          ));
  }
}
}
