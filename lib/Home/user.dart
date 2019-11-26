import 'dart:async';
import 'dart:convert' show json;

import 'package:dbcrypt/dbcrypt.dart';

import "package:http/http.dart" as http;
import 'package:google_sign_in/google_sign_in.dart';

import '../receipts.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/gmail.readonly',
  ],
);

class Users {
  GoogleSignInAccount _currentUser;
  String name;
  String token;
  String email;
  List<Receipts> receitas;
   Users(){
    this.email = "";
  }
  
  String getName(){
    return this.name;
  }

  Future<void> getFaturas() async {
    var url = 'http://95.179.135.81/receipts';
    this.receitas = new List<Receipts>();
  final http.Response response =
    await http.get(url,headers: {'authorization': this.token});
    print(response.body);
    var rcpt = json.decode(response.body)["receipt"];
    rcpt.forEach((x) => {
      print("nif: " + x["nif"]),
      this.receitas.add(new Receipts(x["nif"],x["price"].toString(),x["date"]))

    });

    
  }

  Future<void> normalLogin(String email, String password ) async {
    var url = 'http://95.179.135.81/users/login';
    
    var hashedPassword = new DBCrypt().hashpw(password, new DBCrypt().gensalt());
      final http.Response response =
        await http.post(url, body:{'password': password,'email': email});
        this.token = json.decode(response.body)["token"];
        
  }

  Future<void> addFatura(String nif, String preco, String date) async {
    var url = 'http://95.179.135.81/receipts';
    print("token de acesso: " + this.token);
    final http.Response response =
        await http.post(url,headers: {'authorization': this.token}, body:{'price': preco,'nif': nif,'date': date});
        print("body da resposta " +response.body);
  }

  Future<void> normalRegister(String email, String password, String name) async{
    print("Email: " + email);
    var url = 'http://95.179.135.81/users/register';
    //var hashedPassword = new DBCrypt().hashpw(password, new DBCrypt().gensalt());
    final http.Response response =
        await http.post(url, body:{'password': password,'email': email, 'name': name, 'type': '2'});
        print("responsebody -----> " + response.body);
        return "DEU";
  }
  
  
  Future<void> handleSignIn() async {
    try {
      _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
        print("mais 1");
        if(account != null){
          print("tou no oncurrentuserchanged");
          print("aqui esta:"+account.email);
        }
        else{
          print("user descontectgado com sucesso");
        }
    });
      await _googleSignIn.signIn().then((data) {
        
        this.name = data.displayName;
        this.email = data.email;
        print("correu bem penso eu");
      });
    } catch (error) {
      print(error);
    }
  }

  Future<void> handleSignOut() async {
    _googleSignIn.disconnect();
  
  }

  

  
}
