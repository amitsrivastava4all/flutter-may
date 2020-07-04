import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerexampleappdemo1/models/playermodel.dart';
import 'package:providerexampleappdemo1/screens/playerview.dart';

void main() {
//  runApp(MaterialApp(
//    title: 'Provider Demo',
//  ));
  runApp(ChangeNotifierProvider(
    builder: (ctx) => PlayerModel(),
    child: MaterialApp(
      title: 'Provider Example Code',
      home: PlayerView(),
    ),
  ));
}
