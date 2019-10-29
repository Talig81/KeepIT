import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return footerContainer();
  }

  Widget footerContainer() => Container(
        height: 100,
        child: Row(
          children: <Widget>[
            footerButtons(),
            footerLanguage(),
          ],
        ),
      );

  Widget footerButtons() => Row();
  Widget footerLanguage() => Row();
}
