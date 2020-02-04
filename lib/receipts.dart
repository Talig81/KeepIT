import 'dart:core';

import 'dart:ffi';

class Receipt{
  String id;
  String company;
  String cae;
  String date;
  String price;
  String user;
  String category;

  Receipt(String id, String price, String date, String category){
    this.date = date;
    this.company = id;
    this.price = price; 
    this.category = category;
  }

  void setId(String iid){
    this.id = iid;
  }
  void setCompany(String cmp){
    this.company = cmp;
  }
  void setCat(Float cat){
    this.price = price;
  }
  void setUser(String userr){
    this.user = userr;
  }
  
}