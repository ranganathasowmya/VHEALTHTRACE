import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:url_launcher/url_launcher.dart';

class Suggestion extends StatefulWidget {
  @override
  _SuggestionState createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<void> send() async {
    final Email email = Email(
      body: 'ratings:' +
          rating_value.toString() +
          '\n\n What is working well on this App?\n\n' +
          para1 +
          '\n\nSuggestions for improvement:\n\n' +
          para2,
      subject: 'feedback on VHealthTrace Application',
      recipients: [_recipientController.text],
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }
  }

  final _recipientController = TextEditingController(
    text: 'sowmyaar.cse@gmail.com',
  );

  final _subjectController = TextEditingController();

  final _bodyController = TextEditingController();

  String body = '', subject = '';
  var rating = 0.0;
  double rating_value = 0.0;
  String para1 = '', para2 = '';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // TODO: implement build
    //throw UnimplementedError();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Suggestion/Feedback'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    // end: Alignment.bottomRight,
                    colors: <Color>[
                      Colors.orange[900],
                      Colors.orange[800],
                      Colors.orange[400],
                    ])),
          ),
          leading: GestureDetector(
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            onLongPress: () {
              _showAlertDialog();
            },
          ),

        ),

        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height:20.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Container(
//                   margin: EdgeInsets.all(10.0),
                      decoration: new BoxDecoration(
//                    gradient: LinearGradient(colors: [Colors.yellow[700], Colors.redAccent],
//                        begin: Alignment.topRight, end: Alignment.bottomLeft),
                        border: Border.all(color: Colors.red,width: 1.0),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0),
                          bottomRight: Radius.circular(45.0),
                          bottomLeft: Radius.circular(45.0),
                        ),
                        color: Colors.orange.withOpacity(1.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '\nThis App is developed with intension to be used by all the Users to reduce dependencies on Document and  paper.'
                              '\nWe are constantly listening to your feedback.\nPlease feel free to let us know your thoughts on your usage of this App,\n'
                              'what is working good for you and what would you like to improve in this App.\nWhat features would you like to add in this App?\n',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 1.2,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    width: screenWidth/3,
                    height: screenHeight/9,
                    child: Text(
                      'Rate Us',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
//              SingleChildScrollView(
                  SmoothStarRating(
                    color: Colors.orange,
                    rating: rating,
                    isReadOnly: false,
                    size: 50,
                    filledIconData: Icons.star,
                    borderColor: Colors.orange,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    starCount: 5,
                    allowHalfRating: true,
                    spacing: 2.0,
                    onRated: (value) {
                      setState(() {
                        print("rating value -> $value");
                        rating_value = value;
                        print(rating_value);
                      });
                    },
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Container(
                    width: screenWidth/1.1,
                    height: screenHeight/8,
                    child: Text(
                      'What is working well on this App ?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.8,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth,
                    height: screenHeight/5,
                    child: Padding(
                      padding: const EdgeInsets.only(left:15.0,right: 15.0),
                      child: TextField(
                        minLines: 4,
                        maxLines: 20,
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: '----REVIEWS----',
                          filled: true,
                          fillColor: Colors.orange,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
//                              borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
//                              borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            para1 = value;
                            print(para1);
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: screenWidth/1.1,
                    height: screenHeight/9,
                    child: Text(
                      'How can we improve ?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 2.0,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth,
                    height: screenHeight/5,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextField(
                        minLines: 4,
                        maxLines: 20,
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: '----SUGGESTIONS----',
                          filled: true,
                          fillColor: Colors.orange,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
//                              borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
//                              borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            para2 = value;
                            print(para2);
                          });
                        },
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(13.0),

                        child: new FlatButton(
                            color: Colors.orange,
                            padding: const EdgeInsets.all(16.0),
                            textColor: Colors.black,
                            onPressed: ()
                            {
                              setState(() {
                                _launchURL('sowmyaar.cse@gmail.com', 'feedback on vhealthTrace','rating:$rating_value \n\n what is working well on this app? \n\n $para1 \n\n How can we improve? \n\n $para2\n\n ');
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Text(
                                'submit',
                                style: TextStyle(fontSize: 20),
                              ),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  //                ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  _launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<bool> _showAlertDialog() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit the App'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text(
              'No',
              style: TextStyle(
                color: Color(0xFF3B7097),
              ),
            ),
          ),
          new FlatButton(
            onPressed: () => exit(0),
// SystemNavigator.pop(),
//                Navigator.of(context).pop(true),
            child: new Text(
              'Yes',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    ) ??
        false;
  }
}

class StarDisplay extends StatelessWidget {
  final int value;
  const StarDisplay({Key key, this.value = 0})
      : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisSize: MainAxisSize.min,

      children: List.generate(5, (index) {
        return Icon(

          index < value ? Icons.star : Icons.star_border,
        );
      }),
    );
  }
}
