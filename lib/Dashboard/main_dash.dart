import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  _Dashboard createState() => _Dashboard();
}

//TODO:vai ser necessário acrescentar um widget quando tivermos ligação ao backend para saber quem é o utilizador

class _Dashboard extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: swipe(context),
      ),
    );
  }

  Widget swipe(BuildContext context) => new Scaffold(
        backgroundColor: Colors.green[100],
        appBar: AppBar(
          backgroundColor: Colors.teal[400],
        ),
        drawer: Theme(
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
                    accountName: Text('TaliGay'),
                    accountEmail: Text('taliGayisGay@buégay.com'),
                    currentAccountPicture: CircleAvatar(
                      radius: 1,
                      backgroundColor: Colors.white,
                      child: Text(
                        "T",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
