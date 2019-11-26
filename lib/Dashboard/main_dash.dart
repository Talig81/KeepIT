import 'package:flutter/material.dart';
import 'package:keep_it/Home/user.dart';

import './drawer_style.dart';

class Dashboard extends StatefulWidget {
  final Users c;

  const Dashboard({Key key, this.c}) : super(key: key);
  _DashboardState createState() => _DashboardState();
}


class _DashboardState extends State<Dashboard> {
  int _selected = 0;
  TextEditingController nifCont = new TextEditingController();
  TextEditingController priceCont = new TextEditingController();
  TextEditingController dateCont = new TextEditingController();

  void exit(){
    widget.c.handleSignOut();
    Navigator.pop(context);
  }
  var options = [];
  @override
  void initState() {
    super.initState();
  }

  
      

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text(
          'KeepIT',
          style: new TextStyle(
            fontFamily: 'RobotoMono',
            fontSize: 30,
            wordSpacing: 7,
            fontWeight: FontWeight.bold,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(5.0, 5.0),
                blurRadius: 5.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.teal[400],
      ),
      drawer: DrawerStyle(exit: this.exit,c: widget.c),
      body: new Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: bottomChooser(context, _selected),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal[400],
        elevation: 7,
        onTap: (int i) {
          setState(() {
            _selected = i;
          });
        },
        currentIndex: _selected,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            title: Text('Adicionar'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text('Faturas'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_outlined),
            title: Text('Gráficos'),
          ),
        ],
      ),
    );
  }

  Widget makeListTile(int i) => new ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child: Icon(
            Icons.receipt,
            color: Colors.white,
            size: 35,
          ),
        ),
        title: Text(
          "Fatura: "+widget.c.receitas[i].company,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: Row(
          children: <Widget>[
            Icon(Icons.attach_money, color: Colors.yellowAccent),
            Text(widget.c.receitas[i].price.toString()+" euros", style: TextStyle(color: Colors.white))
          ],
        ),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      );

  Widget bottomChooser(BuildContext ctx, int picker) {
    if (picker == 1)
      if(widget.c.receitas == null){
        return Center(child: Container(
          child: Text("Não tem faturas :(",style: TextStyle(color: Colors.white,fontSize: 30))
        ),);
      }
      else{
        return receipts(ctx);
      }
    else
      return addFatura();
  }

  Widget receipts(BuildContext context) => new ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.c.receitas.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(index);
        },
      );

  Widget makeCard(int i) => new Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          child: makeListTile(i),
        ),
      );

  Widget circleImage() {
    return new Container(
      width: 100.0,
      height: 100.0,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
          fit: BoxFit.cover,
          image: new AssetImage('images/mascote.png'),
        ),
      ),
    );
  }

  Widget addFatura() => new Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: avatar(),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                nifField(),
                priceField(),
                dateField(),
                addButton(),
              ],
            ),
            flex: 2,
          ),
        ],
      );

  Widget avatar() => Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: CircleAvatar(
          radius: 55,
          
          backgroundImage: AssetImage('images/background_logo.png'),
        ),
      );

      TextFormField nifField() => new TextFormField(
        controller: nifCont,
        decoration:
            new InputDecoration(icon: Icon(Icons.receipt), labelText: 'Email'),
        onSaved: (String value) {},
        validator: (String value) {
          return value.contains('@') ? 'Do not use the @ char.' : null;
        },
      );

      TextFormField priceField() => new TextFormField(
        controller: priceCont,
        decoration:
            new InputDecoration(icon: Icon(Icons.money_off), labelText: 'Preço'),
        onSaved: (String value) {},
        validator: (String value) {
          return value.contains('@') ? 'Do not use the @ char.' : null;
        },
      );

      TextFormField dateField() => new TextFormField(
        controller: dateCont,
        decoration:
            new InputDecoration(icon: Icon(Icons.timer), labelText: 'Data'),
        onSaved: (String value) {},
        validator: (String value) {
          return value.contains('@') ? 'Do not use the @ char.' : null;
        },
      );

      Widget addButton() => Container(
        width: 100,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: RaisedButton(
          color: Colors.amber[200],
          child: new Text(
            'Adicionar',
            style: TextStyle(color: Colors.teal[800], fontSize: 10),
          ),
          onPressed: () {
            widget.c.addFatura(nifCont.text, priceCont.text, dateCont.text);
            setState((){
              _selected = 1;
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.transparent),
          ),
        ),
      );
}
