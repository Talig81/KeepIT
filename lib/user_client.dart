import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class UserAgentClient {
  var token;
  final client = new http.Client();
  final urlUsers = 'http://95.179.135.81/users';
  final urlLogin = 'http://95.179.135.81/users/login';
  final urlRegister = 'http://95.179.135.81/users/register';
  

  UserAgentClient(){
    this.token = null;
  }

  String getUsers(String token){
    final response = http.get(urlUsers,headers: {'authorization': token});
    response.then((value){
      print(value.body);
    });
    return "deu getusers";
  }

  String getLogin(String email, String password){
    final response = http.post(urlLogin,body:{'email':email,'password':password});
    response.then((value){
      this.token = jsonDecode(value.body)['token'];
      print("meti o token" + this.token);
      this.getUsers(this.token);

      
    });
    return "deu login";
  }

  String doRegister(String email, String password, String name){
    final response = http.post(urlRegister,body:{'email':"talideus81@gmail.com",'password':"deus",'name':'TaliGod'});
    response.then((value){
      print("Este e o body" + jsonDecode(value.body));
      final ss = jsonDecode(value.body);
      
      print(ss['data']['token']);
    });
    return "deu register";
  }

  String addFatura(){
    final response = http.post('http://95.179.135.81/receipts',body:{'nif':"1231234",'date':"cenas",'price':'TaliGod','userId':'5dcb32234b420b3e67fb9a26'});
    response.then((value){
      print(value.body);
      
    });
    return "deu register";
  }

 


}