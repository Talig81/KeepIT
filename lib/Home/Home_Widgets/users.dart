// import 'dart:async';
// import 'dart:convert' show json, utf8;
// import 'dart:io';
// import 'package:shared_preferences/shared_preferences.dart';
// import "package:http/http.dart" as http;
// import 'package:google_sign_in/google_sign_in.dart';
// import '../receipts.dart';

// GoogleSignIn _googleSignIn = GoogleSignIn(
//   scopes: <String>[
//     'email',
//     'https://www.googleapis.com/auth/gmail.readonly',
//   ],
// );

// class Users {
//   GoogleSignInAccount _currentUser;
//   String name;
//   String token;
//   String email;
//   List<Receipts> receitas;
//   Users() {
//     this.email = "";
//   }

//   String getName() {
//     return this.name;
//   }

//   Future<void> deletePrefs() async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.clear();    
//   }

//   _save(String username, String token) async {
//     final prefs = await SharedPreferences.getInstance();
//     final key = 'username';
//     final key2 = 'token';
//     final value = username;
//     final value2 = token;
//     prefs.setString(key, value);
//     prefs.setString(key2, value2);
//   }

//   Future<bool> read() async {
//     final prefs = await SharedPreferences.getInstance();
//     final key = 'username';
//     final value = prefs.getString(key) ?? 0;
//     if (value == 0)
//       return false;
//     else {
//       this.token = prefs.getString('token');
//       this.name = prefs.getString('username');
//       return true;
//     }
//   }

//   Future<void> getFaturas() async {
//     var url = 'https://95.179.135.81/receipts';
//     this.receitas = new List<Receipts>();

//     HttpClient client = new HttpClient();
//     client.badCertificateCallback =
//         ((X509Certificate cert, String host, int port) => true);
//     HttpClientRequest req = await client.getUrl(Uri.parse(url));
//     req.headers.set('content-type', 'application/json');
//     req.headers.set('authorization', this.token);
//     HttpClientResponse response = await req.close();
//     response.transform(utf8.decoder).listen((data) {
//       var rcpt = json.decode(data)["receipt"];
//       if (rcpt != null) {
//         rcpt.forEach((x) => {
//               this
//                   .receitas
//                   .add(new Receipts(x["nif"], x["price"].toString(), x["date"]))
//             });
//         return "Added faturas";
//       }
//     });
//   }

//   Future<int> normalLogin(String email, String password) async {
//     HttpClient client = new HttpClient();
//     client.badCertificateCallback =
//         ((X509Certificate cert, String host, int port) => true);
//     var url = 'https://95.179.135.81/users/login';
//     HttpClientRequest req = await client.postUrl(Uri.parse(url));
//     req.headers.set('content-type', 'application/json');
//     Map body = {
//       "email": email,
//       "password": password,
//     };
//     req.write(json.encode(body));
//     HttpClientResponse response = await req.close();

//     if (response.statusCode == 200) {
//       response.transform(utf8.decoder).listen((data) {
//         var a = json.decode(data);
//         this.token = a['token'];

//         this.email = email;
//         _save(email, token);
//       });
//       return 200;
//     } else {
//       if (response.statusCode == 403)
//         return 403;
//       else
//         return 400;
//     }
//   }

//   Future<void> addFatura(String nif, String preco, String date) async {
//     var url = 'https://95.179.135.81/receipts';
//     final http.Response response = await http.post(url,
//         headers: {'authorization': this.token},
//         body: {'price': preco, 'nif': nif, 'date': date});
//   }

//   Future<int> normalRegister(String email, String password, String name) async {
//     HttpClient client = new HttpClient();
//     client.badCertificateCallback =
//         ((X509Certificate cert, String host, int port) => true);
//     var url = 'https://95.179.135.81/users/register';
//     HttpClientRequest req = await client.postUrl(Uri.parse(url));
//     req.headers.set('content-type', 'application/json');
//     Map body = {
//       "email": email,
//       "password": password,
//       "name": name,
//       "type": 2,
//     };
//     req.write(json.encode(body));
//     HttpClientResponse response = await req.close();
//     return response.statusCode;
//   }

//   Future<void> handleSignIn() async {
//     try {
//       _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
//         if (account != null) {
//           print("tou no oncurrentuserchanged");
//         } else {
//           print("user descontectgado com sucesso");
//         }
//       });
//       await _googleSignIn.signIn().then((data) {
//         this.name = data.displayName;
//         this.email = data.email;
//         testingEmail(data.email, data.authHeaders);
//       });
//     } catch (error) {
//     }
//   }

//   Future<Null> testingEmail(userId, header) async {
    
//     //String url = 'https://www.googleapis.com/gmail/v1/users/' + userId +'/messages/16e5efe23da10829';
//     String url2 = 'http://95.179.135.81/tali';
//     if (header != null)
//       header.then((data) async {
//         print(data['Authorization']);
//         final http.Response response = await http.post(url2, body: {'auth': data['Authorization'], 'userid': userId});
//       });
    
//   }

//   Future<void> handleSignOut() async {
//     _googleSignIn.disconnect();
//     await deletePrefs();
//   }
// }