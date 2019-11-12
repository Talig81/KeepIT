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

  String getUsers(){
    final response = http.get(urlUsers);
    response.then((value){
      print(value.body);
    });
    return "deu";
  }

  String getLogin(String email, String password){
    final response = http.post(urlLogin,body:{'email':email,'password':password});
    response.then((value){
      print(value.body);
    });
    return "deu login";
  }

  String doLogin(){
    final response = http.post(urlRegister,body:{'email':"talideus81@gmail.com",'password':"deus",'name':'TaliGod'});
    response.then((value){
      print(value.body);
    });
    return "deu register";
  }


}