import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  Container _createContainer(mediaQuery, color) {
    return Container(
      color: color,
      width: mediaQuery.width / 4,
      height: mediaQuery.height / 4,
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var per = 60;
    return Scaffold(
      appBar: AppBar(
        title: Text('StateFulDemo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //crossAxisAlignment: CrossAxisAlignment.baseline,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: mediaQuery.height / 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _createContainer(mediaQuery, Colors.redAccent),
                  _createContainer(mediaQuery, Colors.orangeAccent)
                ],
              ),
            ),
            _createContainer(mediaQuery, Colors.greenAccent),
            _createContainer(mediaQuery, Colors.blueAccent)
//          Container(
//              color: Colors.greenAccent,
//              width: mediaQuery.width % per,
//              height: mediaQuery.height % per),
//          Container(
//              color: Colors.blueAccent,
//              width: mediaQuery.width % per,
//              height: mediaQuery.height % per)
          ],
        ),
      ),
    );
  }
}
