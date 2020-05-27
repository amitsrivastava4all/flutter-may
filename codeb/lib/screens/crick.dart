import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../utils/Server.dart';

class Crick extends StatefulWidget {
  @override
  _CrickState createState() => _CrickState();
}

class _CrickState extends State<Crick> {
  _callServer() {
    print("Server Call Starts");
    Future<Response> future = Server.playerInfo(35320);
    print("Server Call Ends");
    future.then((response) {
      var json = response.body;
      print("JSON is $json");
    }).catchError((err) {
      print("Error is $err");
    });
    print("Function Ends");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player Info'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  _callServer();
                },
                child: Text('Call Server'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
