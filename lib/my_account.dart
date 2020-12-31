import 'package:flutter/material.dart';
import 'package:vhealthtrace/register.dart';
import 'package:vhealthtrace/database_helper.dart';
//import 'package:manleos/first.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vhealthtrace/register_ui.dart';
class MyAccount extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //  throw UnimplementedError();
    return MyAccountDetailState();
  }
}
class MyAccountDetailState extends State<MyAccount>
{
  Register reg;
  DatabaseHelper databaseHelper=DatabaseHelper();
  List<Register> regList;
  int count=0;
  List<String> my_list;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    if(regList==null)
    {
      //print('history list null');
      regList=List<Register>();
      updateListView();
    }
    //else{
    //print("history list not null");
    //}
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),centerTitle: true,
        backgroundColor: Colors.orange,

      ),
      body: getFirstList(),

    );
  }
  ListView getFirstList() {
    // print('entering list view');
    print(regList);

    TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        String id=(this.regList[position].id).toString();
        String date=(this.regList[position].date).toString();
        String first=(this.regList[position].first).toString();
        String last=(this.regList[position].last).toString();
        String mail=(this.regList[position].mail).toString();
        String password=(this.regList[position].password).toString();
        String contact=(this.regList[position].contact).toString();
        String address=(this.regList[position].address).toString();
        print(address);
         print('addressssssssssssssssssssss');
        String nwString='First Name:$first\nLast Name:$last\nMail Id:$mail\nContact:$contact\nAddress:$address',heading1='Address:$address';
     //  my_list=['First Name:$first\n','Last Name:$last\n','Mail Id:$mail\n','Contact:$contact\n','Address:$address'];
     //  return my_list[position];
        return Card(
          elevation: 2.0,
          color: Colors.white,
          child: ListTile(

            title: Text(nwString  , style: TextStyle(fontSize: 30,color: Colors.black),textAlign: TextAlign.left,),

            subtitle: Text(heading1, style: TextStyle(fontSize: 30,color: Colors.white),textAlign: TextAlign.left,),

          ),
        );
      },
    );
  }
  void _delete(BuildContext context,Register register) async
  {
    print(register.id);
    int result=await databaseHelper.deleteRegister(register.id);
    if(result!=0)
    {
      _showSnackBar(context,'item deleted successfully');
      updateListView();
    }
  }
  void _showSnackBar(BuildContext context, String message) {

    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
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
          this.regList=regList;
          this.count=regList.length;
        });
      });
    });
  }
}

