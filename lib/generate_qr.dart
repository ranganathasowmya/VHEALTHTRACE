import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:vhealthtrace/register.dart';
import 'package:vhealthtrace/UserClass.dart';
import 'dart:async';
import 'dart:io';
import 'package:vhealthtrace/database_helper.dart';
import 'package:sqflite/sqflite.dart';
String all_value='';
String input=' ';
String a1='',a2='',a3='',a4='',a5='',a6='',a7=' ',name='',a8='',a9='',a10='',a11='',a12='',a13='',a14='';
class Generate extends StatefulWidget
{

  final UserClass object;
   String qr_value;
   Generate(this.object);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //   throw UnimplementedError();
    return _generateState(this.object);
  }
}
class _generateState extends State<Generate>
{
  Register reg1;
  DatabaseHelper databaseHelper=DatabaseHelper();
  List<Register> regList1;
  int count=0;
 // List<String> my_list;
   UserClass object;
  String qr_value;


  _generateState(this.object);
  void login() async
  {
    //   print(username);
    reg1=await  databaseHelper.getLogin1();
   print(reg1);
    print(reg1.password);
    print(reg1.mail);
    name=reg1.first;
    a8=reg1.last;
    a9=reg1.mail;
    a10=reg1.contact;
    a11=reg1.address;
    //print('login...............');
   // print(reg.toString());
    all_value='Name:$name $a8\nMail:$a9\nContact:$a10\nAddress:$a11' ;
   //return all_value;
  }

 //login();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    if(regList1 == null)
    {
      print('history list null');
      regList1=List<Register>();
      updateListView();login();

    }

    login();
    print(name);
   // print(reg.first);
    print('mvfgtyhuikol.,mnbhjuikolp;');

    a1=object.bloodgroup;
    a2=object.bp;
    a3=object.calorie;
    a4=object.pulse;
    a5=object.height;
    a6=object.weight;
    a7=object.date;a13=object.problem;a14=object.medicine;

    print(a8);print('last name');
    input='Date:$a7\n$all_value\nBlood Group:$a1'
        '\nBlood Pressure:$a2\nCalorie:$a3\nPulse:$a4\nHeight:$a5\nWeight:$a6\nProblems:$a13\nMedicine:$a14\n';//,heading='Address:$date';
    return SafeArea(
      child:Scaffold(
        appBar: AppBar(
          title: Text('QR Code Generated'),
          backgroundColor: Colors.orange,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child:SingleChildScrollView(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid,width: 2.0),
                      borderRadius: BorderRadius.circular(15.0)),
                  child:Image.network('https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=$input'),
                  width: 400.0,
                  height: 400.0,
                ),
                SizedBox(height: 10.0,width: 5.0,),


                Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            color: Colors.orange[900],
                            child: Text("Share QR"),
                            textColor: Colors.white,
                            splashColor: Colors.transparent,
                            onPressed: () {
                              //  save();
                              login();
                              print('https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=$input');
                              Share.share('https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=$input');
                            },
                          ),
                        ),
                      ],
                    )
                ),
              ],),
          ),
        ),
      ),
    );
  }
  void updateListView()
  {
    //print("coming to update list view");
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database)
    {
      print(database);
      Future<List<Register>> historyListFuture = databaseHelper.getRegisterList();
      historyListFuture.then((regList)
      {
        setState(() {
          this.regList1=regList;
          this.count=regList.length;
        });
      });
    });
  }
}