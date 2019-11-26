import 'dart:core';

import 'dart:ffi';

class Receipts{
  String id;
  String company;
  String categoria;
  String date;
  String price;
  String user;
  

  Receipts(String id, String price, String date){
    this.date = date;
    this.company = id;
    this.price = price;
    
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