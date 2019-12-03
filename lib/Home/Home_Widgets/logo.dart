 import 'package:flutter/material.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';

 class LogoKit extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return logo();
   }
 }
 
 Widget logo() => Flexible(
        child: Container(
          padding: EdgeInsets.only(
            top: ScreenUtil.instance.setWidth(300.0),
            //bottom: ScreenUtil.instance.setWidth(20),
          ),
          alignment: Alignment.center,
          child: SizedBox(
            width: ScreenUtil.instance.setWidth(600.0),
            height: ScreenUtil.instance.setHeight(700),
            child: Image.asset(
              'images/mascote.png',
            ),
          ),
        ),
      );