import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categories extends StatelessWidget {
  
  Widget build(BuildContext context) {
    MaterialColor color;
    String s;
    return categories(color, s);
  }

    Widget categories(MaterialColor color, String s) => new Row(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
              
                padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(5)),
                width: ScreenUtil.instance.setWidth(30),
                height: ScreenUtil.instance.setHeight(30),
                child: FloatingActionButton(
                  heroTag: s,
                  mini: true,
                  backgroundColor: color,
                  elevation: 0,
                  onPressed: () => {},
                ),
              ),
              SizedBox(width: 5),
              Text('Categoria $s')
            ],
          ),
        ],
      );
}