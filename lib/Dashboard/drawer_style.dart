
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:keep_it/Home/user.dart';

class DrawerStyle extends StatelessWidget{

  final Function exit;
  final Users c;

  const DrawerStyle({Key key, this.exit,this.c}) : super(key: key);

  
  
  

  
  @override
  Widget build(BuildContext context){
    return Theme(
          data: Theme.of(context).copyWith(
            primaryColor:
                Colors.teal[600], //é aqui que se muda a cor do header !!
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
                        'João Cabra'), // mudar aqui quando houver ligação ao backend
                    accountEmail: Text('kitkeepit@buégay.com'),
                    currentAccountPicture: CircleAvatar(
                      radius: 1,
                      backgroundColor: Colors.white,
                      child: Text(
                        "KIT",
                        style: TextStyle(fontSize: 30.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.teal[400]),
                  child: ListTile(
                    title: Text(
                      'Gmail Feature',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      this.c.handleSignIn();
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
                      'Categorias',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      
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
                      'Estatísticas',
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
                      'Sair',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      exit();
                      Navigator.pop(context);
                     
                    },
                  ),
                )
              ],
            ),
          ),
        );
  }
}