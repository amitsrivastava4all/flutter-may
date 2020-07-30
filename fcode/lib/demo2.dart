import 'package:flutter/material.dart';

class Demo2 extends StatefulWidget {
  @override
  _Demo2State createState() => _Demo2State();
}

class _Demo2State extends State<Demo2> {
  ColorTween colorTween = ColorTween(begin: Colors.red, end: Colors.green);
  //Tween<double> _size = Tween<double>(begin: 1, end: 3 * pi);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tween'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: TweenAnimationBuilder(
            tween: colorTween,
            // tween: _size,
            duration: Duration(seconds: 4),
            builder: (ctx, color, child) {
              return Container(
                color: color,
                width: 100,
                height: 100,
              );
//              return Transform.rotate(
//                  angle: angle,
//                  child: Image.network(
//                      'https://i1.wp.com/macsources.com/wp-content/uploads/2012/09/BotSquareMark128x128.png?resize=128%2C128&ssl=1'));
//              return Transform.scale(
//                  scale: scale,
//                  child: Container(
//                    margin: EdgeInsets.only(top: 100),
//                    width: 100,
//                    height: 100,
//                    color: Colors.green,
//                  ));
            },
          ),
        ),
      ),
    );
  }
}
