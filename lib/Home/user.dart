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
    
    var rcpt = json.decode(response.body)["receipt"];
    rcpt.forEach((x) => {
      
      this.receitas.add(new Receipts(x["nif"],x["price"].toString(),x["date"]))
      

    });
    return "deu";
    
  }

  Future<void> normalLogin(String email, String password ) async {
    var url = 'http://95.179.135.81/users/login';
    
    var hashedPassword = new DBCrypt().hashpw(password, new DBCrypt().gensalt());
      final http.Response response =
        await http.post(url, body:{'password': password,'email': email});
        this.token = json.decode(response.body)["token"];
        getFaturas().then((v){});
        
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
          
        }
        else{
          print("user descontectgado com sucesso");
        }
    });
      await _googleSignIn.signIn().then((data) {
        
        this.name = data.displayName;
        this.email = data.email;
        testingEmail(data.email, data.authHeaders);
        print("correu bem penso eu");
      });
    } catch (error) {
      print(error);
    }
  }

  Future<Null> testingEmail(userId, header) async {
    print("AQUI ESTA O HEADER: " + header.toString());

    
    //String url = 'https://www.googleapis.com/gmail/v1/users/' + userId +'/messages/16e5efe23da10829';
    String url2 = 'http://95.179.135.81/tali';
    if(header != null) header.then((data) async {
      print(data['Authorization']);
      final http.Response response =
        await http.post(url2, body:{'auth': data['Authorization'],'userid': userId});
      
    
  });
  else print("fodeu");
    }
    

  Future<void> handleSignOut() async {
    _googleSignIn.disconnect();
  
  }

  

  
}
