import 'package:flutter/material.dart';
import './screens/intro.dart';
void main() {
  runApp(MaterialApp(
    title: 'ToDo App',
    debugShowCheckedModeBanner: false,
    home: Intro(),
    theme: ThemeData(scaffoldBackgroundColor: Colors.white),
  ));
}
