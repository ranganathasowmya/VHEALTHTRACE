import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vhealthtrace/register.dart';
import 'package:vhealthtrace/database_helper.dart';
import 'package:vhealthtrace/user_display.dart';
//import 'package:vhealthtrace/user_profile.dart';
import 'package:intl/intl.dart';
import 'package:vhealthtrace/UserClass.dart';
class user_profile_ui extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return user_profile();
  }

}
class user_profile extends State<user_profile_ui> {
  var _formKey = GlobalKey<FormState>();
  UserClass userClass;
  DatabaseHelper helper=DatabaseHelper();
  String para1;

  //_NoteDetailState(this.note, this.appBarTitle);


  TextEditingController blood = TextEditingController();
  TextEditingController pulse = TextEditingController();
  TextEditingController blood_group = TextEditingController();
  TextEditingController calorie = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController problems = TextEditingController();
  TextEditingController medicines = TextEditingController();

  @override
  Widget build(BuildContext context){
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
                  Text("VHEALTHTRACE",style: TextStyle(color: Colors.white, fontSize: 40),),
                  SizedBox(height: 20,),
                  Text("User Profile",style: TextStyle(color: Colors.white, fontSize: 20),),
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
                                    controller: blood_group,
                                    onFieldSubmitted: (value) {
                                      // updateTitle();
                                      print(value);
                                      if(value.endsWith("positive")|| value.endsWith("negative"))
                                        {
                                          blood_group.text=value;
                                        }
                                      else
                                        {
                                          blood_group.text='';
                                          _showAlertDialog1('enter valid blood group\nEg b positive', '');
                                        }
                                    },
                                    decoration: InputDecoration(

                                        hintText: "Blood Group Eg:b positive",
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
                                    keyboardType: TextInputType.number,
                                    style: textStyle,
                                    controller: pulse,
                                    onFieldSubmitted: (value) {
                                      // updateTitle();
                                      print(value);
                                    },
                                    decoration: InputDecoration(

                                        hintText: "Pulse Eg:72",
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
                                   // keyboardType: TextInputType.number,
                                    style: textStyle,
                                    controller: blood,
                                    onFieldSubmitted: (value) {
                                      // updateTitle();
                                      print(value);

                                    },
                                    decoration: InputDecoration(
                                        hintText: " Blood Pressure Eg:120/80",
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
                                    keyboardType: TextInputType.number,
                                    style: textStyle,
                                    //obscureText: true,
                                    controller: calorie,

                                    onFieldSubmitted: (value) {
                                      // updateTitle();
                                      print(value);
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Calorie Eg:1600",
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
                                    controller: height,
                                    keyboardType: TextInputType.number,

                                    onFieldSubmitted: (value) {
                                      // updateTitle();
                                      print(value);
                                    },
                                    decoration: InputDecoration(

                                        hintText: "Height Eg:5.4 inches",
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

                                    keyboardType: TextInputType.number,
                                    style: textStyle,        controller: weight,
                                    onFieldSubmitted: (value) {
                                      // updateTitle();
                                      print(value);
                                    },
                                    decoration: InputDecoration(

                                        //labelStyle: textStyle,
                                        hintText: "Weight Eg:50 kg",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ) ,

                                  ),
                                ),
                                Container(
                                  width: screenWidth,
                                  height: screenHeight/4,
                                  padding: const EdgeInsets.only(left:15.0,right: 15.0),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200]))

                                  ),

                                  child: TextFormField(
                                    minLines: 4,
                                    maxLines: 20,

                                   // keyboardType: TextInputType.number,
                                    style: textStyle,        controller: problems,

                                    onFieldSubmitted: (value) {
                                      // updateTitle();
                                      print(value);
                                    },
                                    decoration: InputDecoration(

                                      //labelStyle: textStyle,
                                        hintText: "Enter your previous problems  if any\nEg:sugar \n",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ) ,

                                  ),
                                ),
                                Container(
                                  width: screenWidth,
                                  height: screenHeight/4,
                                  padding: const EdgeInsets.only(left:15.0,right: 15.0),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200]))

                                  ),

                                  child: TextFormField(
                                    minLines: 4,
                                    maxLines: 20,

                                    // keyboardType: TextInputType.number,
                                    style: textStyle,        controller: medicines,

                                    onFieldSubmitted: (value) {
                                      // updateTitle();
                                      print(value);
                                    },
                                    decoration: InputDecoration(

                                      //labelStyle: textStyle,
                                        hintText: "Enter medicines recommended by doctor if any\nEg:crocin \n",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ) ,

                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 140),


                          RaisedButton(
                            color: Colors.orange[900],
                            child: Text("Save Profile"),
                            textColor: Colors.white,
                            splashColor: Colors.yellow,
                            onPressed: () {
                              // if(_formKey.currentState.validate())
                              if(blood_group.text==''||pulse.text==''||blood.text==''||calorie.text==''||height.text==''||weight.text=='')
                              {
                                _showAlertDialog1('status', 'please enter all credentials');
                              }
                              else
                              {
                                print('saved');
                                _save();
                              }
                            },
                          ),
                          SizedBox(height: 200,
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
  void _save() async {
    print('save function');
    String date1 = DateFormat.yMd().add_jm().format(DateTime.now());
    int result,r1;
    userClass = UserClass.withId(
        blood_group.text,
        blood.text,
        pulse.text,
        calorie.text,
        height.text,
        weight.text,problems.text,medicines.text,
        date1);
    if (userClass.id != null) {
      // Case 1: Update operation
      print('history id');
      result = await helper.insertUser(userClass);
      print(result);
      r1=await helper.deleteUser(result-1);
      print(r1);
    }
    else { // Case 2: Insert Operation
      print('else part');
      result = await helper.insertUser(userClass);
      print(result);
      r1=await helper.deleteUser(result-1);
      print(r1);//      navigateToDetail();
    }

    if (result != 0) { // Success
      // _showAlertDialog1('Status', 'data Saved Successfully');
      // Navigator.push(context, MaterialPageRoute(builder: ))
      Navigator.of(context).push(
          MaterialPageRoute<Null>(builder: (BuildContext context) {
            return new UserAccount();
          }));
    } else { // Failure
      //_showAlertDialog1('Status', 'Problem Saving data');
    }
  }
  void _showAlertDialog1(String title, String message) {

    AlertDialog alertDialog = AlertDialog(
      title: Text(message),
      //content: Text(message),
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
