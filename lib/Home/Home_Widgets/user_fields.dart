import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserFields extends StatelessWidget {
  String s;

  UserFields(s) : this.s = s;

  @override
  Widget build(BuildContext context) {
    if (s == 'Registar') {
      return Column(
        children: <Widget>[
          nameField(),
          SizedBox(height: 10),
          emailField(),
          SizedBox(height: 10),
          passField(),
        ],
      );
    }
    else if(s == 'Login'){
      return Column(
        children: <Widget>[
          emailField(),
          SizedBox(height: 10),
          passField(),
        ],
      );
    }

    return Container();
  }

  Container nameField() => Container(
        width: ScreenUtil.instance.setWidth(900),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.teal[800]),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Theme(
          data: ThemeData(primaryColor: Colors.teal[900]),
          child: new TextFormField(
            cursorColor: Colors.teal[900],
            decoration: new InputDecoration(
              border: InputBorder.none,
              hintText: "Nome",
              icon: Icon(Icons.person),
              hintStyle: TextStyle(
                fontSize: 16.0,
                color: Colors.teal[900],
                inherit: false,
              ),
            ),
            onSaved: (String value) {},
            validator: (String value) {
              return value.contains('@') ? 'Do not use the @ char.' : null;
            },
          ),
        ),
      );

  Container emailField() => Container(
        width: ScreenUtil.instance.setWidth(900),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.teal[800]),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Theme(
          data: ThemeData(primaryColor: Colors.teal[900]),
          child: new TextFormField(
            cursorColor: Colors.teal[900],
            decoration: new InputDecoration(
              border: InputBorder.none,
              hintText: "Email",
              icon: Icon(Icons.email),
              hintStyle: TextStyle(
                fontSize: 16.0,
                color: Colors.teal[900],
                inherit: false,
              ),
            ),
            onSaved: (String value) {},
            validator: (String value) {
              return value.contains('@') ? 'Do not use the @ char.' : null;
            },
          ),
        ),
      );

  Container passField() => Container(
        width: ScreenUtil.instance.setWidth(900),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.teal[800]),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Theme(
          data: ThemeData(primaryColor: Colors.teal[900]),
          child: new TextFormField(
            obscureText: true,
            cursorColor: Colors.teal[900],
            decoration: new InputDecoration(
              border: InputBorder.none,
              hintText: "Password",
              icon: Icon(Icons.vpn_key),
              hintStyle: TextStyle(
                fontSize: 16.0,
                color: Colors.teal[900],
                inherit: false,
              ),
            ),
            onSaved: (String value) {},
            validator: (String value) {
              return value.contains('@') ? 'Do not use the @ char.' : null;
            },
          ),
        ),
      );
}
