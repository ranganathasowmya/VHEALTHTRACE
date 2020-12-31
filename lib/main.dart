
import 'package:vhealthtrace/homepage.dart';
//import 'package:vhealthtrace/login.dart';
//import 'package:database_flutter_app/screens/note_list.dart';
import 'package:flutter/material.dart';
//import 'package:vhealthtrace/login.dart';


void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "VhealthTrace",
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.lime
      ),
      home: Login1(),
    );
  }
}