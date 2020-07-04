import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerexampleappdemo1/models/playermodel.dart';

class PlayerEdit extends StatefulWidget {
  @override
  _PlayerEditState createState() => _PlayerEditState();
}

class _PlayerEditState extends State<PlayerEdit> {
  String name = '';
  String photo = 'https://3team.cricket/images/png/header_2_dop.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player edit Screen'),
      ),
      body: SingleChildScrollView(
        child:
            Consumer<PlayerModel>(builder: (context, playerModelObject, child) {
          return Column(
            children: <Widget>[
              Container(
                child: Image.network(playerModelObject.player.photo ?? photo),
                width: 300,
                height: 300,
              ),
              Text('Name is ${playerModelObject.player.name ?? name}'),
              Text(
                  'Data from First Screen ${playerModelObject.player.desc ?? ''}')
            ],
          );
        }),
      ),
    );
  }
}
