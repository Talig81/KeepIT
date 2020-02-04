import 'package:flutter/material.dart';

class DrawerStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.teal[600], //é aqui que se muda a cor do header !!
        canvasColor: Colors.teal[600],
      ),
      child: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text(
                    'Maria'), // mudar aqui quando houver ligação ao backend
                accountEmail: Text('mariafurtado@keepit.com'),
                currentAccountPicture: CircleAvatar(
                  radius: 1,
                  backgroundColor: Colors.white,
                  child: Text(
                    "M",
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.teal[400]),
              child: ListTile(
                title: Text(
                  'Faturas',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/dashboard');
                },
              ),
            ),
            SizedBox(
              height: 3,
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.teal[400]),
              child: ListTile(
                title: Text(
                  'Estatísticas',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/dashboard/stats');
                },
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.teal[400]),
              child: ListTile(
                title: Text(
                  'Partilhas',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {},
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.teal[400]),
              child: ListTile(
                title: Text(
                  'Definições',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {},
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.teal[400]),
              child: ListTile(
                title: Text(
                  'FAQ',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {},
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.teal[400]),
              child: ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
