import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:vhealthtrace/UserClass.dart';
import './register.dart';
//import './historyDetail.dart';
class DatabaseHelper{

  static DatabaseHelper _databaseHelper;
  static Database _database;
  String registerTable='Register_TABLE';
  String colDate = 'date';
  String first='first';
  String last='last';
  String mail = 'mail';
  String password='password';
  String contact = 'contact';
  String address='address';
  String colInteger='id';
  String userTable='user_TABLE';
  String colDate1 = 'date';
  String blood_group='bloodgroup';
  String B_P='bp';
  String pulse = 'pulse';
  String calorie='calorie';
  String weight = 'weight';
  String height='height';
  String problem = 'problem';
  String medicine='medicine';
  String colInteger1='id';
  DatabaseHelper._createInstance();
  factory DatabaseHelper()
  {
    if(_databaseHelper==null)
    {
      _databaseHelper=DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }
  Future<Database> get database async{
    if(_database==null)
    {
      _database=await initializeDatabase();
    }
    return _database;
  }
  Future<Database> initializeDatabase() async
  {
    Directory directory=await getApplicationDocumentsDirectory();
    String path=directory.path+'user_register15.db';
    var historyDatabase=await openDatabase(path,version: 1,onCreate: _createDb);
    return historyDatabase;
  }
  void _createDb(Database db,int newVersion) async{
    await db.execute('CREATE TABLE $registerTable ($colInteger INTEGER PRIMARY KEY AUTOINCREMENT,$colDate TEXT,'
        '$first TEXT,'
        '$last TEXT,'
        '$mail TEXT,'
        '$password TEXT,'
        '$contact TEXT,'
        '$address TEXT )');
    await db.execute('CREATE TABLE $userTable ($colInteger1 INTEGER PRIMARY KEY AUTOINCREMENT,$colDate1 TEXT,'
        '$blood_group TEXT,'
        '$B_P TEXT,'
        '$calorie TEXT,'
        '$pulse TEXT,'
        '$weight TEXT,'
        '$height TEXT,'
        '$problem TEXT,$medicine TEXT )');
  }
  Future<List<Map<String, dynamic>>> getRegisterMapList() async {
    Database db = await this.database;
    var result = await db.query(registerTable, orderBy: '$colInteger DESC');
    return result;
  }
  Future<List<Map<String, dynamic>>> getUserMapList() async {
    Database db = await this.database;
    var result = await db.query(userTable, orderBy: '$colInteger DESC');
    return result;
  }

  // Insert Operation: Insert a Note object to database
  Future<int> insertRegister(Register reg) async {
    print('insert history');
    Database db = await this.database;
    var result = await db.insert(registerTable, reg.toMap());
    print('result');
    print(result);
    return result;
  }
  Future<int> insertUser(UserClass userClass) async {
    print('insert history');
    Database db = await this.database;
    var result = await db.insert(userTable, userClass.toMap());
    print('result');
    print(result);
    return result;
  }
  // Delete Operation: Delete a Note object from database
  Future<int> deleteRegister(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $registerTable WHERE $colInteger = $id');
    return result;
  }
  Future<int> deleteUser(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $userTable WHERE $colInteger = $id');
    return result;
  }
  // Get number of Note objects in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> object = await db.rawQuery('SELECT COUNT (*) from $registerTable');
    int result = Sqflite.firstIntValue(object);
    return result;
  }
  Future<int> getCount1() async {
    Database db = await this.database;
    List<Map<String, dynamic>> object = await db.rawQuery('SELECT COUNT (*) from $userTable');
    int result = Sqflite.firstIntValue(object);
    return result;
  }

  Future<Register> getLogin(String user, String password) async {
    Database db = await this.database;
    var res = await db.rawQuery("SELECT * FROM $registerTable WHERE mail = '$user' and password = '$password'");

    if (res.length > 0) {
      return new Register.fromMapObject(res.first);//.fromMap(res.first);
    }
    return null;
  }
  Future<Register> getLogin1() async {
    Database db = await this.database;
    var res = await db.rawQuery("SELECT * FROM $registerTable");

    if (res.length > 0) {
      return new Register.fromMapObject(res.first);//.fromMap(res.first);
    }
    return null;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<Register>> getRegisterList() async {

    var registerMapList = await getRegisterMapList();//MapList(); // Get 'Map List' from database
    print(registerMapList);
    int count = registerMapList.length;         // Count the number of map entries in db table
    print(count);
    List<Register> registerList = List<Register>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      registerList.add(Register.fromMapObject(registerMapList[i]));
    }
    print(registerList);
    return registerList;
  }
  Future<List<UserClass>> getUserList() async {
    var userMapList = await getUserMapList();//MapList(); // Get 'Map List' from database
    print(userMapList);
    int count = userMapList.length;         // Count the number of map entries in db table
    print(count);
    List<UserClass> UserList = List<UserClass>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      UserList.add(UserClass.fromMapObject(userMapList[i]));
    }
    print(UserList);
    return UserList;
  }
}