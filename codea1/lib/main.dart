import 'package:flutter/material.dart';

import './screens/imageviewer.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My First App',
      //home: ListViewDemo()
      home: ImageViewer()
      //home: News()
      //home: Second()
      //home: GreetApp()
      // home: StackDemo()
      // home: SplashDemo()
      //home: First(),
      ));
}
