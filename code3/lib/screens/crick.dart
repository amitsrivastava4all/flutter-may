import 'dart:convert' as jsonobj;

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../utils/Server.dart';

class Crick extends StatefulWidget {
  @override
  _CrickState createState() => _CrickState();
}

class _CrickState extends State<Crick> {
  String _playerName = '';
  _getPlayerId() {
    Future<Response> future = Server.getPlayerId(_playerName);
    future.then((response) {
      print("Response of Player Name ");
      var json = response.body;
      print('JSON is $json');
      print(json.runtimeType);
      var jsonMap = jsonobj.jsonDecode(json);
      print("Map is $jsonMap");
      print('PID ${jsonMap['data'][0]['pid']}');
      int pid = jsonMap['data'][0]['pid'];
      print(jsonMap.runtimeType);
      Future<Response> res = _callServer(pid);
      res.then((res2) {
        print("RES2 is ${res2.body} ");
        setState(() {
          playerObject = jsonobj.jsonDecode(res2.body);
          print("Set State Call $playerObject");
        });
      }).catchError((e) {
        print("Error During PID CALL $e");
      });
    }).catchError((err) {
      print("Get Player ID Error is $err");
    });
  }

  var playerObject;
  _callServer(int pid) {
    print("Server Call Starts");
    Future<Response> future = Server.playerInfo(pid);
    print("Server Call Ends");
    return future;
//    future.then((response) {
//      var json = response.body;
//      print("JSON is $json");
//    }).catchError((err) {
//      print("Error is $err");
//    });
//    print("Function Ends");
  }

  @override
  Widget build(BuildContext context) {
    print("Build Called...");
    var media = MediaQuery.of(context).size;
    var buttonSize = 100;
    const defaultImage =
        'https://cdn.iconscout.com/icon/free/png-256/laptop-user-1-1179329.png';
    return Scaffold(
      appBar: AppBar(
        title: Text('Player Info'),
        actions: <Widget>[
          Row(
            children: <Widget>[
              Container(
                //width: 300,
                width: media.width - buttonSize,
                padding: EdgeInsets.all(5),
                child: TextField(
                  style: TextStyle(fontSize: 30, color: Colors.white),
                  onChanged: (String str) {
                    _playerName = str;
                    print("Change Call $_playerName");
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.red,
                      ),
                      hintText: 'Type to Search',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 25)),
                ),
              ),
              Container(
                child: RaisedButton(
                  color: Colors.yellowAccent,
                  onPressed: () {
                    _getPlayerId();
                  },
                  child: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Image.network(playerObject == null
                    ? defaultImage
                    : playerObject['imageURL']),
              ),
              Container(
                child:
                    Text(playerObject == null ? '' : playerObject['fullName']),
              ),
              Container(
                child: Text(
                    playerObject == null ? '' : playerObject['currentAge']),
              ),
              Container(
                child: Text(playerObject == null ? '' : playerObject['born']),
              ),
              Container(
                child: Text(
                    playerObject == null ? '' : playerObject['battingStyle']),
              )
//              RaisedButton(
//                onPressed: () {
//                  _callServer();
//                },
//                child: Text('Call Server'),
//              )
            ],
          ),
        ),
      ),
    );
  }
}
