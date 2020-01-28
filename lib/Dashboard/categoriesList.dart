import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesList extends StatefulWidget {
  _CategoriesList createState() => _CategoriesList();
}

class _CategoriesList extends State<CategoriesList> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return categoriesList(context);
  }

  final List cat = [
    //TODO: arranjar esta porra
    'Compras',
    'Saúde',
    'Veículos',
    'Imobiliária',
    'Veterinári',
  ];
  int i = 0;

  Widget categoriesList(BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height / 20,
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
                top: ScreenUtil.instance.setHeight(35),
              ),
              width: MediaQuery.of(context).size.width / 5,
              height: 20,
              color: Colors.grey[300],
              child: FlatButton(
                onPressed: () {}, //TODO: mudar cor disto quando carregar 
                color: Colors.grey[500],
                child: Text(cat[i++],
                    style: TextStyle(
                      fontSize: ScreenUtil.instance.setWidth(37),
                      fontFamily: 'OpenSans',
                    ),
                    textAlign: TextAlign.justify),
              ),
            );
          },
        ),
      );
}
