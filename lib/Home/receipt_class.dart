import 'dart:core';

import 'dart:ffi';

class Receipt{
  String id;
  String company;
  String cae;
  String category;
  String date;
  String total;
  String user;
  bool isWarranty = false;

  Receipt(String companyid, String total, String date,String cat){
    this.date = date;
    this.company = companyid;
    this.total = total; 
    this.category = cat;
  }

  void setId(String iid){
    this.id = iid;
  }
  void setCompany(String cmp){
    this.company = cmp;
  }
  void setCat(Float cat){
    this.total = total;
  }
  void setUser(String userr){
    this.user = userr;
  }
  
}