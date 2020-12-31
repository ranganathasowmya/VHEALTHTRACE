import 'package:flutter/material.dart';
class UserClass
{
  int _id;
  String _date;
  String _bloodgroup;
  String _bp;
  String _pulse;
  String _calorie;
  String _height;
  String _weight;
  String _problems;
  String _medicine;

  UserClass.withId(this._bloodgroup,this._bp,this._pulse,this._calorie,this._height,this._weight,this._problems,this._medicine,this._date);

  int get id=>_id;
  String get date=>_date;
  String get bloodgroup=>_bloodgroup;
  String get bp=> _bp;
  String get calorie=>_calorie;
  String get pulse=>_pulse;
  String get height=> _height;
  String get weight=>_weight;
  String get problem=> _problems;
  String get medicine=>_medicine;



  set date(String newDate) => this._date=newDate;
  set bloodgroup(String newItem) => this._bloodgroup=newItem;
  set bp(String angle) => this._bp=angle;
  set pulse(String angle) => this._pulse =angle;
  set calorie(String angle) => this._calorie=angle;
  set height (String angle) => this._height=angle;
  set weight (String angle) => this._weight=angle;
  set problem (String angle) => this._problems=angle;
  set medicine (String angle) => this._medicine=angle;


  Map<String,dynamic> toMap()
  {
    var map=Map<String,dynamic>();
    if(id!=null)
    {
      map['id']=_id;
    }
    map['date']=_date;
    map['bloodgroup']=_bloodgroup;
    map['bp']=_bp;
    map['pulse']=_pulse;
    map['calorie']=_calorie;
    map['height']=_height;
    map['weight']=_weight;
    map['problem']=_problems;
    map['medicine']=_medicine;
    return map;
  }

  UserClass.fromMapObject(Map<String,dynamic> map)
  {
    this._id=map['id'];
    this._date=map['date'];
    this._bloodgroup=map['bloodgroup'];
    this._bp=map['bp'];
    this._pulse=map['pulse'];
    this._calorie=map['calorie'];
    this._height=map['height'];
    this._weight=map['weight'];
    this._problems=map['problem'];
    this._medicine=map['medicine'];
  }
}