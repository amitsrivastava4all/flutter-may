import 'package:flutter/material.dart';

import '../utils/stringoperations.dart';

class GreetApp extends StatefulWidget {
  @override
  _GreetAppState createState() => _GreetAppState();
}

class _GreetAppState extends State<GreetApp> {
  String _msg = 'Hello';
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
              Container(
                padding: EdgeInsets.all(media.width / 50),
                child: TextField(
                  controller: _firstCtrl,
                  style: TextStyle(fontSize: 30),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.red,
                      ),
                      labelText: 'Enter Your Name',
                      labelStyle: TextStyle(color: Colors.green),
                      hintText: 'Type Your First Name'),
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  autocorrect: true,
                ),
                margin: EdgeInsets.only(top: media.height / 24),
              ),
              Container(
                padding: EdgeInsets.all(media.width / 50),
                child: TextField(
                  controller: _secondCtrl,
                  style: TextStyle(fontSize: 30),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.red,
                      ),
                      labelText: 'Enter Your Lastname',
                      labelStyle: TextStyle(color: Colors.green),
                      hintText: 'Type Your Last Name'),
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  autocorrect: true,
                ),
                margin: EdgeInsets.only(top: media.height / 24),
              ),
              Container(
                padding: EdgeInsets.all(media.width / 50),
                child: MaterialButton(
                  elevation: 5,
                  color: Colors.greenAccent,
                  onPressed: () {
                    _sayWelcome();
                  },
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Say Welcome',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: media.width / 60),
                child: Text(
                  _msg,
                  style: TextStyle(fontSize: 30),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextEditingController _firstCtrl = TextEditingController();
  TextEditingController _secondCtrl = TextEditingController();
  void _sayWelcome() {
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
