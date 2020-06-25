import 'package:flutter/material.dart';

import './login.dart';
import '../utils/constants.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  _moveToLoginPage(context) {
    print("I am Here");
    Navigator.push(context, MaterialPageRoute(builder: (c) => Login()));
    print("Login Click");
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
                  'ToDo App',
                  style: TextStyle(fontSize: 30),
                ),
                Image.network(Constants.mainImage),
                Container(
                  width: media.width * 0.60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: FlatButton(
                      onPressed: () {
                        print("On Press Called");
                        _moveToLoginPage(context);
                      },
                      child: Text('Login'),
                      color: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
