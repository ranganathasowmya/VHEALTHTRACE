import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vhealthtrace/register.dart';
import 'package:vhealthtrace/database_helper.dart';
import 'package:vhealthtrace/user2.dart';
//import 'package:vhealthtrace/user_profile.dart';
import 'package:intl/intl.dart';

import 'new_local.dart';
class Register_ui extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
   return Register1();
  }

}
class Register1 extends State<Register_ui> {
  var _formKey = GlobalKey<FormState>();
  Register reg;
  DatabaseHelper databaseHelper=DatabaseHelper();
  DatabaseHelper helper = DatabaseHelper();
  TextEditingController first=TextEditingController();
  TextEditingController last=TextEditingController();
  TextEditingController mail=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController contact=TextEditingController();
  TextEditingController address=TextEditingController();


  @override
  Widget build(BuildContext context){
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.orange[900],
                  Colors.orange[800],
                  Colors.orange[400],
                ]
            )
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Text("VHEALTHTRACE",style: TextStyle(color: Colors.white, fontSize: 30),textAlign: TextAlign.center,),
                  SizedBox(height: 20,),
                  Text("Register",style: TextStyle(color: Colors.white, fontSize: 20),textAlign: TextAlign.center,),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
                child:SingleChildScrollView(
                  key: _formKey,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget> [
                          SizedBox(height: 30,),
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, 3),
                                    blurRadius: 20,
                                    offset: Offset(0,10)
                                )]
                            ),
                            child: Column(
                              //key:_formKey,
                              children: <Widget> [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                  ),
                                  child: TextFormField(
                                    style: textStyle,
                                    controller: first,
                                    validator: (String userInput) {
                                      if(userInput.isEmpty) {
                                        return 'Please enter first name';
                                      }
                                    },
                                    onFieldSubmitted: (value) {
                                      // updateTitle();
                                      print(value);
                                      if(value.length<=2)
                                      {
                                        _showAlertDialog1('', 'Enter Valid Name');

                                      }
                                      else{
                                        first.text=value;
                                        String  s= value.substring(0,1);
                                        //int a=s;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        hintText: "First Name",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ) ,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                  ),
                                  child: TextFormField(
                                    style: textStyle,
                                    controller: last,
                                    validator: (String userInput) {
                                      if(userInput.isEmpty) {
                                        return 'Please enter last name';
                                      }
                                    },
                                    onFieldSubmitted: (value) {
                                      // updateTitle();
                                      print(value);
                                    },
                                    decoration: InputDecoration(

                                        hintText: "Last Name",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                  ),
                                  child: TextFormField(
                                    style: textStyle,
                                    controller: mail,

                                    onFieldSubmitted: (value) {
                                      // updateTitle();
                                      print(value);
                                      if(value.endsWith('@gmail.com'))
                                        {
                                          print('gmail correct');
                                          mail.text=value;
                                        }
                                      else{
                                        //enter a valid mail)
                                        mail.text='';
                                      _showAlertDialog1('','enter a valid mail id');
                                      }
                                    },
                                    decoration: InputDecoration(

                                        hintText: "Email ID",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ) ,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                  ),
                                  child: TextFormField(
                                    style: textStyle,
                                    obscureText: true,
                                    controller: password,
                                    validator: (String userInput) {
                                      if(userInput.isEmpty) {
                                        return 'Please enter password';
                                      }
                                    },
                                    onFieldSubmitted: (value) {
                                      // updateTitle();
                                      print(value);
                                      if(value.length<=5)
                                        {
                                          _showAlertDialog1('', 'password should contain an UpperCase,LowerCase and Digit of  minimum length 5');

                                        }
                                      else{
                                        password.text=value;
                                        String  s= value.substring(0,1);
                                        //int a=s;
                                      }
                                    },
                                    decoration: InputDecoration(

                                        hintText: "Password",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ) ,
                                  ),
                                ), Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                  ),
                                  child: TextFormField(
                                    style: textStyle,
                                    controller: contact,
                                    keyboardType: TextInputType.number,
                                    validator: (String userInput) {
                                      if(userInput.isEmpty) {
                                        return 'Please enter 10 digit number';
                                      }
                                    },
                                    onFieldSubmitted: (value) {
                                      // updateTitle();
                                      //value.length;
                                      print(value.length);
                                      if(value.length==10)
                                        {
                                          contact.text=value;
                                        }
                                      else{
                                        contact.text='';
                                        _showAlertDialog1('enter 10 digit number', 'enter 10 digit number');
                                      }
                                    },
                                    decoration: InputDecoration(

                                        hintText: "Contact",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ) ,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                  ),
                                  child: RaisedButton(
                                    color: Colors.orange[900],
                                    child: Text("Location"),
                                    textColor: Colors.white,
                                    splashColor: Colors.yellow,
                                    onPressed: () {
                                      //  save();
                                    //  print('location');
                                     // _geolocator();
                                      //print('sowmya');
                                      if(first.text==''||last.text==''||mail.text==''||password.text==''||contact.text=='')
                                      {
                                        _showAlertDialog1('status', 'please enter all credentials');
                                      }
                                      else
                                      {
                                        Navigator.of(context).push(
                                            MaterialPageRoute<Null>(builder: (BuildContext context) {
                                              return new MyApp(first.text,last.text,mail.text,password.text,contact.text);
                                            })
                                        );
                                      }

                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 200,),

                        ],
                      ),
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );

  }
  void _save() async {
    print('save function');
    String date1 = DateFormat.yMd().add_jm().format(DateTime.now());
    int result,r1;
    reg=Register.withId(first.text,last.text,mail.text,password.text,contact.text,address.text,date1);
    if (reg.id != null)
    {
      // Case 1: Update operation
      print('history id');
      result = await helper.insertRegister(reg);
      print(result);
      r1=await helper.deleteRegister(result-1);
      print(r1);

    }
    else
    { // Case 2: Insert Operation
      print('else part');
      result = await helper.insertRegister(reg);
//      navigateToDetail();
      r1=await helper.deleteRegister(result-1);
      print(r1);
    }

    if (result != 0) {  // Success
      //_showAlertDialog1('Status', 'data Saved Successfully');
      //Navigator.push(context, MaterialPageRoute(builder: ))

    } else {  // Failure
      //  _showAlertDialog1('Status', 'Problem Saving data');
    }
  }
  void _showAlertDialog1(String title, String message) {

    AlertDialog alertDialog = AlertDialog(
      title: Text(message),
     // content: Text(message),
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog
    );
  }
  void moveToLastScreen() {
    Navigator.pop(context, true); // passing the true value to noteList screen.
  }
}
