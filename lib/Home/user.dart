import 'dart:async';
import 'dart:convert' show json;

import 'package:firebase_auth/firebase_auth.dart';
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
  String email;
  List<Receipts> receitas;
   Users(){
    this.email = "";
  }
  
  String getName(){
    return this.name;
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
    print(this.name + " SDFSDFD");
  }

  

  
}
