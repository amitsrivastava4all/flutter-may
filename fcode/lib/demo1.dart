import 'package:flutter/material.dart';

class Demo1 extends StatefulWidget {
  @override
  _Demo1State createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {
  double _width = 100;
  double _height = 100;
  bool flag = true;

  _changeIt() {
    setState(() {
      if (flag) {
        _width = 300;
        _height = 300;
      } else {
        _width = 100;
        _height = 100;
      }
      flag = !flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Demo'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                _changeIt();
              },
              child: Text('Animate It'),
            ),
            SizedBox(
              height: 50,
            ),
            AnimatedContainer(
              curve: Curves.elasticInOut,
              duration: Duration(seconds: 2),
              width: _width,
              height: _height,
              color: Colors.orangeAccent,
              child: Text(
                'Animated Container',
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
