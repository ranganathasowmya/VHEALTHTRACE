import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vhealthtrace/database_helper.dart';
//import 'package:vhealthtrace/encryption.dart';
import 'package:vhealthtrace/register.dart';
import 'package:vhealthtrace/register_ui.dart';
import 'package:vhealthtrace/user_display.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_string_encryption/flutter_string_encryption.dart';
import 'package:vhealthtrace/new_local.dart';

class Login1 extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   // throw UnimplementedError();
  return HomePage();
  }
}

class HomePage extends State<Login1>
{
  var _formKey1 = GlobalKey<FormState>();


  Register object;
  //_NoteDetailState(this.note, this.appBarTitle);

  DatabaseHelper helper=DatabaseHelper();
  //Register object;
  //_NoteDetailState(this.note, this.appBarTitle);

 // DatabaseHelper helper=DatabaseHelper();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context){
    //initPlatformState();
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

            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget> [
                      Text("VHEALTHTRACE",style: TextStyle(color: Colors.white, fontSize: 30)),
                      SizedBox(height: 20,),
                      Text("Login",style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(
                  child:SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                      ),
                      child: Padding(

                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: <Widget> [

                            SizedBox(height: 20,),
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
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget> [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                    ),
                                    child: TextFormField(
                                      controller: titleController,
                                      validator: (String userInput) {
                                        if(userInput.isEmpty) {
                                          return 'Please enter mail';
                                        }
                                      },

                                      onFieldSubmitted: (value) {
                                        // updateTitle();
                                        print(value);
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
                                      obscureText: true,
                                      controller: descriptionController,
                                      validator: (String userInput) {
                                        if(userInput.isEmpty) {
                                          return 'Please enter password';
                                        }
                                      },

                                      onFieldSubmitted: (value) {
                                        // updateTitle();
                                        print(value);
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Password",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            //(height: 30,),


                            SizedBox(height: 20,),
                           // Text("Forgot Password",style: TextStyle(color: Colors.grey),),
                            RaisedButton(

                              color: Colors.orange[900],
                              child: Text("Login"),
                              textColor: Colors.white,
                              splashColor: Colors.yellow,
                              onPressed: () {
                                //if(_formKey1.currentState.validate())
                                if(titleController.text==''||descriptionController.text=='')
                                {
                                  _showAlertDialog1('please enter mail or password', 'please enter mail or password');
                                  }
                                else{
                                  //  save();

                                  print('login.....................');
                                  login(titleController.text,descriptionController.text);

                                }
                              },
                            ),
                            SizedBox(height: 30,
                              width: 60,),
                            RaisedButton(
                              color: Colors.orange[900],
                              child: Text("Create New Account"),
                              textColor: Colors.white,
                              splashColor: Colors.yellow,
                              onPressed: () {
                                // save();
                                Navigator.of(context).push(
                                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                                      return new Register_ui();
                                    })
                                );
                              },
                            ),
                            SizedBox(height: 350,
                              width: 60,),


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

  void login(String username,String password) async
  {
    print(username);
    object=await  helper.getLogin(username, password);
    // print(object.password);
    //print(object.mail);
    print('login...............');
    print(object.toString());
    if(object.toString()=='null')
    {
      print(object);
      _showAlertDialog1('Create Account', 'Invalid Login');
      titleController.text='';
      descriptionController.text='';

    }
    else{
      print(object.toString());
      Navigator.of(context).push(
          MaterialPageRoute<Null>(builder: (BuildContext context) {
            return new UserAccount();
          })
      );
    }
  }
  void _showAlertDialog1(String title, String message)
  {
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