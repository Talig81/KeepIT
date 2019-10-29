import 'package:flutter/material.dart';
import 'package:keep_it/windows_manager.dart';

class HomeWindows extends StatefulWidget {
  final int chooseWindow;
  HomeWindows({
    @required this.chooseWindow,
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
    int cenas = widget.chooseWindow;
    return Expanded(
      child: WindowsManager(chosenWindow: 2),
    );
  }

}


