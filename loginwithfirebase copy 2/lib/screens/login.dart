import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/User.dart';
import '../utils/constants.dart';
import '../utils/db.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String msg = '';
  _register() {
    User user = new User(userid.text, pwd.text);
    Future<DocumentReference> docRef = Db.addUser(user);
    docRef.then((result) {
      // Read all Records (Users)
      Future<QuerySnapshot> future = Db.readAllRecords();
      future.then((snapShot) {
        snapShot.documents.forEach((record) => print(record.data));
      }).catchError((err) => print("Error During Record Fetch $err"));
      setState(() {
        msg = 'Record Added ${result.documentID}';
      });
      print("Result is $result");
    }).catchError((err) {
      setState(() {
        msg = 'Error in Add';
      });

      print("Error During Add $err");
    });
  }

  TextEditingController userid = TextEditingController();
  TextEditingController pwd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: media.height,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Positioned(
                child: Image.network(
                  Constants.leftTopCorner,
                  height: media.height * 0.50,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Image.network(
                  Constants.leftBottomCorner,
                  height: media.height * 0.30,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Register $msg',
                    style: TextStyle(fontSize: 30),
                  ),
                  Image.network(Constants.login),
                  Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.pink[50]),
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: TextField(
                        controller: userid,
                        decoration: InputDecoration(
                            hintText: 'Type Userid Here',
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.person)),
                      )),
                  Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.pink[50]),
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: TextField(
                        controller: pwd,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Type Password Here',
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.visibility_off),
                            prefixIcon: Icon(Icons.lock)),
                      )),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    width: media.width * 0.60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: FlatButton(
                        onPressed: () {
                          _register();
                        },
                        child: Text('Register'),
                        color: Colors.blue,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Image.network(
                              'https://freeiconshop.com/wp-content/uploads/edd/facebook-outline.png'),
                          width: 55,
                          height: 55,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 3,
                                color: Colors.blueAccent,
                              )),
                        ),
                        Container(
                          child: Image.network(
                              'https://cdn.iconscout.com/icon/free/png-256/google-1772223-1507807.png'),
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 3,
                                color: Colors.blueAccent,
                              )),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
