import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const url = 'assets/images/therock.jpg';
    //const url =
    //'https://cdn130.picsart.com/297616565009201.jpg?type=webp&to=crop&r=256';
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Container(
            //color: Colors.greenAccent,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.redAccent,
              Colors.greenAccent,
              Colors.yellowAccent
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: CircleAvatar(
              maxRadius: 200,
              //backgroundImage: NetworkImage(url),
              backgroundImage: AssetImage(url),
            ),
          ),
          Positioned(
            top: 550,
            left: 100,
            child: Text(
              'Loading...',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 60,
            left: 25,
            child: Text(
              'My App Intro Screen...',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          )
          /*Banner(
            message: "Brain Mentors",
            location: BannerLocation.topStart,
          )*/
        ],
      )),
    );
  }
}
