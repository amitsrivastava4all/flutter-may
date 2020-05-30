import 'package:flutter/material.dart';

import './shape.dart';
import '../ui/button.dart';
import '../ui/textbox.dart';
import '../utils/stringoperations.dart';

class GreetApp extends StatefulWidget {
  @override
  _GreetAppState createState() => _GreetAppState();
}

class _GreetAppState extends State<GreetApp> {
  String _msg = 'Hello';
  _clearAll() {
    _firstCtrl.text = '';
    _secondCtrl.text = '';
  }

  @override
  Widget build(BuildContext context) {
    print("Build Called....");
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Greet App'),
        //centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: media.height / 24),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Greet App',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.red),
                  )
                ],
              ),
              TextBox(_firstCtrl, 'First Name'),
              TextBox(_secondCtrl, 'Last Name'),

//              Container(
//                padding: EdgeInsets.all(media.width / 50),
//                child: TextField(
//                  controller: _firstCtrl,
//                  style: TextStyle(fontSize: 30),
//                  decoration: InputDecoration(
//                      border: OutlineInputBorder(),
//                      prefixIcon: Icon(
//                        Icons.person,
//                        size: 50,
//                        color: Colors.red,
//                      ),
//                      labelText: 'Enter Your Name',
//                      labelStyle: TextStyle(color: Colors.green),
//                      hintText: 'Type Your First Name'),
//                  keyboardType: TextInputType.text,
//                  autofocus: true,
//                  autocorrect: true,
//                ),
//                margin: EdgeInsets.only(top: media.height / 24),
//              ),
//              Container(
//                padding: EdgeInsets.all(media.width / 50),
//                child: TextField(
//                  controller: _secondCtrl,
//                  style: TextStyle(fontSize: 30),
//                  decoration: InputDecoration(
//                      border: OutlineInputBorder(),
//                      prefixIcon: Icon(
//                        Icons.person,
//                        size: 50,
//                        color: Colors.red,
//                      ),
//                      labelText: 'Enter Your Lastname',
//                      labelStyle: TextStyle(color: Colors.green),
//                      hintText: 'Type Your Last Name'),
//                  keyboardType: TextInputType.text,
//                  autofocus: true,
//                  autocorrect: true,
//                ),
//                margin: EdgeInsets.only(top: media.height / 24),
//              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  Button(
                    'Say Welcome',
                    _sayWelcome,
                    flex: 2,
                    color: Colors.red,
                  ),
                  Button(
                    'Clear All',
                    _clearAll,
                    flex: 1,
                  ),

//                  Expanded(
//                    flex: 2,
//                    child: Container(
//                      padding: EdgeInsets.all(media.width / 50),
//                      child: MaterialButton(
//                        elevation: 5,
//                        color: Colors.greenAccent,
//                        onPressed: () {
//                          _sayWelcome();
//                        },
//                        padding: EdgeInsets.all(10),
//                        child: Text(
//                          'Say Welcome',
//                          style: TextStyle(fontSize: 20),
//                        ),
//                      ),
//                    ),
//                  ),
//                  Expanded(
//                    flex: 1,
//                    child: Container(
//                      padding: EdgeInsets.all(media.width / 50),
//                      child: MaterialButton(
//                        elevation: 5,
//                        color: Colors.greenAccent,
//                        onPressed: () {
//                          _clearAll();
//                        },
//                        padding: EdgeInsets.all(10),
//                        child: Text(
//                          'Clear',
//                          style: TextStyle(fontSize: 20),
//                        ),
//                      ),
//                    ),
//                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: media.width / 60),
                child: Card(
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Colors.lightGreenAccent,
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      _msg,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ),
              ShapeDemo()
            ],
          ),
        ),
      ),
    );
  }

  TextEditingController _firstCtrl = TextEditingController();
  TextEditingController _secondCtrl = TextEditingController();
  void _sayWelcome() {
    print("I am in Say Welcome");
    String firstName = _firstCtrl.text;
    String lastName = _secondCtrl.text;

    //_msg = 'Welcome '+firstName+' '+lastName;
    setState(() {
      _msg =
          "Welcome ${StringOperations.initCap(firstName)} ${StringOperations.initCap(lastName)}";
    });
    //_msg = "Welcome $firstName $lastName";
    print("Say Welcome   " + _msg);
  }
}
