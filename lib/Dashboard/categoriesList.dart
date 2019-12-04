import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesList extends StatelessWidget {
  Widget build(BuildContext context) {
    return categoriesList(context);
  }

  List cat = [
    'Compras ',
    'Saúde ',
    'Veículos ',
    'Compras ',
    'Saúde ',
    'Veículos '
  ];
  int i = 0;

  Widget categoriesList(BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height - 850,
        child: new ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil.instance.setWidth(1.0),
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(
                left: ScreenUtil.instance.setWidth(25),
                right: ScreenUtil.instance.setWidth(13),
                top: ScreenUtil.instance.setHeight(40),
              ),
              width: MediaQuery.of(context).size.width - 280,
              height: 20,
              color: Colors.grey[300],
              child: Text(cat[i++],
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.justify),
            );
          },
        ),
      );
}
