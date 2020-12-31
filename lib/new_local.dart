import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:vhealthtrace/register.dart';
import 'package:vhealthtrace/database_helper.dart';
import 'package:vhealthtrace/user2.dart';

LatLng pinPosition = LatLng(12.9334987, 77.5530868);
Position position;
class MyApp extends StatefulWidget {
  String first,last,mail,pass,contact;
  MyApp(this.first,this.last,this.mail,this.pass,this.contact);
  @override
  _MyAppState createState() => _MyAppState(first,last,mail,pass,contact);
}


class _MyAppState extends State<MyApp> {
  String first,last,mail,pass,contact;
  _MyAppState(this.first,this.last,this.mail,this.pass,this.contact);
  Register reg;
  DatabaseHelper databaseHelper=DatabaseHelper();
  BitmapDescriptor pinLocationIcon;
   final titleController=TextEditingController();
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();
   String addr='';








  void _geolocator() async
  {

    if(titleController.text.isEmpty)
      {
        position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    pinPosition=LatLng(position.latitude,position.longitude);
    try{
      final coordinates = new Coordinates(pinPosition.latitude,pinPosition.longitude);
      var address = await Geocoder.local.findAddressesFromCoordinates(coordinates);
     // print(address);
      var first = address.first;
      //print(first);
      //print("${first.featureName} : ${first.addressLine}");
      addr="${first.featureName}: ${first.addressLine}".toString();
      //   return addr;
    }
    catch(e) {
      print("Error occured: $e");
    }
      }
    else
      {
      //print('full');
      //new_location_finder(titleController.text);

     // print("latitude:"+pinPosition.latitude.toString());
      //print("longitude:"+pinPosition.longitude.toString());
      try{
        //print("latitude:..........."+pinPosition.latitude.toString());
        //print("longitude:.............."+pinPosition.longitude.toString());
        final coordinates = new Coordinates(pinPosition.latitude,pinPosition.longitude);
        var address = await Geocoder.local.findAddressesFromCoordinates(coordinates);
        //print(address);
        var first = address.first;
        //print(first);
       // print("${first.featureName} : ${first.addressLine}");
        addr="${first.featureName}: ${first.addressLine}".toString();
        //   return addr;
      }
      catch(e) {
        print("Error occured: $e");
      }
    }
  }


  @override
  void initState() {
    super.initState();
    setCustomMapPin();
    _geolocator();
   // print(titleController.text);
    //new_location_finder(titleController.text);
    //setCustomMapPin();

  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'images/markers.png');
  }


  // these are the minimum required values to set
  // the camera position




 CameraPosition initialLocation = CameraPosition(
     zoom: 16,
     bearing: 30,
      target: LatLng(pinPosition.latitude,pinPosition.longitude),
  );
  void _onMapCreated(GoogleMapController controller) {
    //_controller.complete(controller);
    setState(() {
      _geolocator();
  //    print(titleController.text);
    //  print(controller.toString());
     // print('controller printed');
      _markers.add(
          Marker(
              markerId: MarkerId('<MARKER ID>'),
              position:pinPosition,
              icon: pinLocationIcon,
             onTap: ()
             {
               setState(() {
               //  print('marker pressed');
                 _geolocator();
                 //print(titleController.text);


                 showModalBottomSheet(context: context, builder: (builder){
                   return Container(
                    height: 150.0,

                     color: Colors.white,
                     child: new Column(
                       children:<Widget>[
                         new  Text('$addr',style: TextStyle(fontSize: 20),),
                         new  RaisedButton(
                           color: Colors.orange[900],
                           child: Text("Save"),
                           textColor: Colors.white,
                           splashColor: Colors.yellow,
                           onPressed: () {
                             //  save();
                             print(first);
                           //  _geolocator();
                             //print(addr);
                            _save();
                             Navigator.of(context).push(
                                 MaterialPageRoute<Null>(builder: (BuildContext context) {
                                   return new user_profile_ui();
                                 })
                             );
               //new_location_finder();
                           },
                         ),

                       ]

                     ),
                   );
                 });
               });
             },
          ));
    });
  }
  void _save() async {
    print('save function');
    String date1 = DateFormat.yMd().add_jm().format(DateTime.now());
    int result,r1;
    reg=Register.withId(first,last,mail,pass,contact,addr,date1);
    if (reg.id != null)
    {
      // Case 1: Update operation
      print('history id');
      result = await databaseHelper.insertRegister(reg);
      print(result);
      r1=await databaseHelper.deleteRegister(result-1);
      print(r1);
    }
    else
    { // Case 2: Insert Operation
      print('else part');
      result = await databaseHelper.insertRegister(reg);
//      navigateToDetail();
      r1=await databaseHelper.deleteRegister(result-1);
      print(r1);
    }

    if (result != 0) {  // Success
     // _showAlertDialog1('Status', 'data Saved Successfully');
      //Navigator.push(context, MaterialPageRoute(builder: ))

    } else {  // Failure
       // _showAlertDialog1('Status', 'Problem Saving data');
    }
  }
  void _showAlertDialog1(String title, String message) {

    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
       content: Text(message),
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Location'),
          backgroundColor: Colors.orange,
        ),
        body: GoogleMap(
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          markers: _markers,

          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(

            target: LatLng(pinPosition.latitude,pinPosition.longitude),

            zoom: 13.0,

          ),

        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}