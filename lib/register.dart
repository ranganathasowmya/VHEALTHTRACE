import 'package:flutter/material.dart';
class Register
{
  int _id;
  String _date;
  String _first;
  String _last;
  String _mail;
  String _password;
  String _contact;
  String _address;

  Register.withId(this._first,this._last,this._mail,this._password,this._contact,this._address,this._date);
  Register.name(this._first,this._last,this._mail,this._password,this._contact,this._address,this._date);
  int get id=>_id;
  String get date=>_date;
  String get first=>_first;
  String get last=> _last;
  String get mail=>_mail;
  String get password=>_password;
  String get contact=> _contact;
  String get address=>_address;

  set date(String newDate) => this._date=newDate;
  set first(String newItem) => this._first=newItem;
  set last (String angle) => this._last=angle;
  set mail(String angle) => this._mail =angle;
  set password(String angle) => this._password=angle;
  set contact (String angle) => this._contact=angle;
  set address (String angle) => this._address=angle;

  Map<String,dynamic> toMap()
  {
    var map=Map<String,dynamic>();
    if(id!=null)
    {
      map['id']=_id;
    }
    map['date']=_date;
    map['first']=_first;
    map['last']=_last;
    map['mail']=_mail;
    map['password']=_password;
    map['contact']=_contact;
    map['address']=_address;
    return map;
  }

  Register.fromMapObject(Map<String,dynamic> map)
  {
    this._id=map['id'];
    this._date=map['date'];
    this._first=map['first'];
    this._last=map['last'];
    this._mail=map['mail'];
    this._password=map['password'];
    this._contact=map['contact'];
    this._address=map['address'];
  }
}