import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  TextEditingController _ctrl;
  String _msg;
  Icon _icon;
  int _fontSize;
  TextBox(TextEditingController ctrl, String msg, {Icon icon, int fontSize}) {
    this._ctrl = ctrl;
    this._msg = msg;
    this._icon = icon;
    this._fontSize = fontSize;
  }
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(media.width / 50),
      child: TextField(
        controller: _ctrl,
        style: TextStyle(fontSize: _fontSize ?? 30),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: _icon ??
                Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.red,
                ),
            labelText: 'Enter Your $_msg',
            labelStyle: TextStyle(color: Colors.green),
            hintText: 'Type Your $_msg'),
        keyboardType: TextInputType.text,
        autofocus: true,
        autocorrect: true,
      ),
      margin: EdgeInsets.only(top: media.height / 24),
    );
  }
}
