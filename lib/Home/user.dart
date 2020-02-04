import 'dart:async';
import 'dart:convert' show json, jsonDecode, utf8;
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import "package:http/http.dart" as http;

import '../receipts.dart';

class Users {
  int total=0;
  String name;
  String token;
  String email;
  List<Receipt> receitas;
  Users() {
    this.email = "";
  }

  String getName() {
    return this.name;
  }

  Future<void> deletePrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  _save(String username, String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'username';
    final key2 = 'token';
    final value = username;
    final value2 = token;
    prefs.setString(key, value);
    prefs.setString(key2, value2);
  }

  Future<bool> read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'username';
    final value = prefs.getString(key) ?? 0;
    if (value == 0)
      return false;
    else {
      this.token = prefs.getString('token');
      this.name = prefs.getString('username');
      return true;
    }
  }

  Future<String> getFaturasDifferent() async {
    final url = 'http://142.93.140.126:2014/receipts';
    this.receitas = new List<Receipt>();
    this.receitas = new List<Receipt>();
    Map<String, String> headers = {
      "authorization": "Bearer " + this.token,
      "Accept": "application/json",
      "Content-type": "application/json"
    };
    final response = http.get(url, headers: headers);
    await response.then((value) {
      final cenas = jsonDecode(value.body);
      var recp;
      for (recp in cenas) {
        int asdf = recp["total"];
        this.total = asdf + total;
         print("loopas " + total.toString());
         
        this.receitas.add(new Receipt(recp["company_id"].toString(), recp["total"].toString(),recp["date"] ,recp["category"]));
       
        
      }
      print(this.receitas.toString());
      return("deu");
    }).catchError((onError){
      return ("erro");
    });

  }

  Future<void> getFaturas() async {
    var url = 'http://142.93.140.126:2014/receipts';
    this.receitas = new List<Receipt>();
    HttpClient client = new HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    HttpClientRequest req = await client.getUrl(Uri.parse(url));
    req.headers.set('content-type', 'application/json');
    req.headers.set('authorization', "Bearer " + this.token);
    HttpClientResponse response = await req.close();
    response.transform(utf8.decoder).listen((data) {
      var rcpt = json.decode(data);
      if (rcpt != null) {
        rcpt.forEach((x) => {
              
            });
        return "Added faturas";
      }
    });
  }

  Future<int> normalLogin(String email, String password) async {
    HttpClient client = new HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    var url = 'http://142.93.140.126:2014/users/login';
    HttpClientRequest req = await client.postUrl(Uri.parse(url));
    req.headers.set('content-type', 'application/json');
    Map body = {
      "email": email,
      "password": password,
    };
    req.write(json.encode(body));
    HttpClientResponse response = await req.close();

    if (response.statusCode == 200) {
      response.transform(utf8.decoder).listen((data) {
        var a = json.decode(data);
        this.token = a['token'];

        this.email = email;
        _save(email, token);
      });
      return 200;
    } else {
      if (response.statusCode == 403)
        return 403;
      else
        return 400;
    }
  }

  Future<void> addFatura(String nif, String preco, String date) async {
    var url = 'https://95.179.135.81/receipts';
    final http.Response response = await http.post(url,
        headers: {'authorization': this.token},
        body: {'price': preco, 'nif': nif, 'date': date});
  }

  Future<int> normalRegister(String email, String password, String name) async {
    HttpClient client = new HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    var url = 'https://95.179.135.81/users/register';
    HttpClientRequest req = await client.postUrl(Uri.parse(url));
    req.headers.set('content-type', 'application/json');
    Map body = {
      "email": email,
      "password": password,
      "name": name,
      "type": 2,
    };
    req.write(json.encode(body));
    HttpClientResponse response = await req.close();
    return response.statusCode;
  }

  Future<Null> testingEmail(userId, header) async {
    //String url = 'https://www.googleapis.com/gmail/v1/users/' + userId +'/messages/16e5efe23da10829';
    String url2 = 'http://142.93.140.126:2014/tali';
    if (header != null)
      header.then((data) async {
        print(data['Authorization']);
        final http.Response response = await http.post(url2,
            body: {'auth': data['Authorization'], 'userid': userId});
      });
  }
}
