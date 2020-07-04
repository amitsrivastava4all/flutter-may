import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerexampleappdemo1/models/playermodel.dart';
import 'package:providerexampleappdemo1/screens/playeredit.dart';

class PlayerView extends StatefulWidget {
  @override
  _PlayerViewState createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView> {
  final GlobalKey<ScaffoldState> skey = new GlobalKey<ScaffoldState>();
  moveToNextScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => PlayerEdit()));
  }

  String name = '';
  String photo = 'https://3team.cricket/images/png/header_2_dop.png';
  showSnackBar(String msg) {
    skey.currentState.showSnackBar(SnackBar(
      content: Text(msg),
      duration: Duration(seconds: 3),
    ));
  }

  getDataFromServer() {
    PlayerModel playerModel = Provider.of<PlayerModel>(context);
    playerModel.loadFromServer();
    showSnackBar("Data is Coming from the Server");
  }

  shareData() {
    String mydata = tc.text;
    PlayerModel playerModel = Provider.of<PlayerModel>(context);
    playerModel.player.desc = mydata;
    showSnackBar('Data has been shared....');
  }

  TextEditingController tc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: skey,
      appBar: AppBar(
        title: Text('Player View'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              moveToNextScreen();
            },
            icon: Icon(
              Icons.forward,
              size: 30,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Fetch'),
              onPressed: () {
                getDataFromServer();
              },
            ),
            Consumer<PlayerModel>(
              builder: (context, playerModelObject, child) {
                return Column(
                  children: <Widget>[
                    Container(
                      child: Image.network(
                          playerModelObject.player.photo ?? photo),
                      width: 300,
                      height: 300,
                    ),
                    Text('Name is ${playerModelObject.player.name ?? name}')
                  ],
                );
              },
            ),
            TextField(
              controller: tc,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Type to Share'),
            ),
            RaisedButton(
              onPressed: () {
                shareData();
              },
              child: Text('Send Data to Another Screen'),
            )
          ],
        ),
      ),
    );
  }
}
