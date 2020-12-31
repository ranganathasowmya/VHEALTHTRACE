import 'package:flutter/material.dart';
import 'package:vhealthtrace/UserClass.dart';
import 'package:vhealthtrace/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vhealthtrace/my_account.dart';
import 'package:vhealthtrace/user2.dart';
import 'package:vhealthtrace/feedback.dart';
import 'package:vhealthtrace/generate_qr.dart';
class UserAccount extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //  throw UnimplementedError();
    return UserAccountDetailState();
  }
}
class UserAccountDetailState extends State<UserAccount>
{
  UserClass reg;
  DatabaseHelper databaseHelper=DatabaseHelper();
  List<UserClass> regList;
  int count=0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    if(regList==null)
    {
      //print('history list null');
      regList=List<UserClass>();
      updateListView();
    }
    //else{
    //print("history list not null");
    //}
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),centerTitle: true,
       backgroundColor: Colors.orange,
      ),
      body: getFirstList(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(

              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  'Menu',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24,color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        Colors.orange,
                        Colors.red,
//                        Color(0xFF75BDE0),
                      ])
//            color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.edit,color: Colors.red,),
              title: Text('Update Profile', style: TextStyle(fontSize: 18,color: Colors.blue,)),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                      return new user_profile_ui();
                    }));
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback,color: Colors.red,),
              title: Text('Feedback', style: TextStyle(fontSize: 18,color: Colors.blue,)),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                      return new Suggestion();
                    }));
              },
            ),
            ListTile(
              leading: Icon(Icons.supervisor_account,color: Colors.red,),
              title: Text('My Account', style: TextStyle(fontSize: 18,color: Colors.blue,)),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                      return new MyAccount();
                    }));
              },
            )
          ],
        ),
      ),
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
        String first=(this.regList[position].bloodgroup).toString();
        String last=(this.regList[position].bp).toString();
        String mail=(this.regList[position].calorie).toString();
        String password=(this.regList[position].pulse).toString();
        String contact=(this.regList[position].height).toString();
        String address=(this.regList[position].weight).toString();
        String problem=(this.regList[position].problem).toString();
        String medicine=(this.regList[position].medicine).toString();

        String nwString='Blood Group:$first\nBlood Pressure:$last\nCalorie:$mail\nPulse:$password\nHeight:$contact\nWeight:$address\nProblems:$problem\nMedicine:$medicine\n',heading='date:$date';

        return Card(
          elevation: 3.0,
          color: Colors.white,
          child: ListTile(
            title: Text(heading  , style: titleStyle),
            subtitle: Text(nwString,style:  titleStyle),
            //subtitle: Text(this.noteList[position].description,style: titleStyle,),
            trailing:GestureDetector(
              child:
              Icon(Icons.share,color: Colors.black,),
              onTap: ()
              {
                print('SCAN TAPPED');
                print(regList[position]);
//                _delete(context, regList[position]);
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                      return new Generate(regList[position]);
                    })
                );
              },
            ),


          ),

        );

      },
      //child:
    );

  }
  void _delete(BuildContext context,UserClass userClass) async
  {
    print(userClass.id);
    int result=await databaseHelper.deleteUser(userClass.id);
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
      Future<List<UserClass>> historyListFuture = databaseHelper.getUserList();
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

