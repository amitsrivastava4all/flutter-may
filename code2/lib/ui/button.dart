import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String _label;
  Function _fn;
  int _flex;
  Color _color;
  Button(String label, Function fn, {int flex, Color color}) {
    this._label = label;
    this._fn = fn;
    this._flex = flex;
    this._color = color;
  }
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Expanded(
      flex: _flex ?? 1,
      child: Container(
        padding: EdgeInsets.all(media.width / 50),
        child: MaterialButton(
          elevation: 5,
          color: _color ?? Color.fromRGBO(255, 150, 10, 1),
          onPressed: () {
            _fn();
          },
          padding: EdgeInsets.all(10),
          child: Text(
            _label,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
