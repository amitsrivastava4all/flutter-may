import 'package:flutter/material.dart';

class First extends StatelessWidget {
  AppBar _createAppBar() {
    return AppBar(
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.person,
            size: 30,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.sync,
            size: 30,
          ),
        )
      ],
      centerTitle: true,
      elevation: 5,
      leading: Icon(
        Icons.home,
        color: Colors.black,
        size: 50,
      ),
      backgroundColor: Colors.redAccent,
      title: Text(
        'MyFirst App',
        style: TextStyle(fontSize: 30),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const url =
        'https://pbs.twimg.com/profile_images/729762910562484225/uYPbK_R1_400x400.jpg';
    // TODO: implement build
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _createAppBar(),
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        color: Colors.tealAccent.shade200,
        child: Container(
          //margin: EdgeInsets.only(top: deviceSize.height * 0.10),
          //padding: EdgeInsets.all(50),
          child: Image.network(
            url,
            fit: BoxFit.fitHeight,
          ),
//          child: Text(
//            'Hello My App Demo',
//            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//          ),
        ),
      ),
    );

    /*
    return SafeArea(
      child: Container(
        color: Colors.tealAccent,
        child: Center(
            child: Text(
          'My First 2020 App ',
          style: TextStyle(fontSize: 40, color: Colors.redAccent),
        )),
      ),
    );*/
  }
}
