import 'package:flutter/material.dart';

import './screens/todolist.dart';

void main() {
  runApp(MaterialApp(
    title: 'ToDo App',
    debugShowCheckedModeBanner: false,
    home: ToDoList(),
    //home: Intro(),
    theme: ThemeData(scaffoldBackgroundColor: Colors.white),
  ));
}
