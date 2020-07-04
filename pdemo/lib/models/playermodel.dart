import 'package:flutter/material.dart';
import 'package:providerexampleappdemo1/models/player.dart';
import 'package:providerexampleappdemo1/utils/server.dart';

class PlayerModel extends ChangeNotifier {
  Player player = new Player();
  loadFromServer() async {
    var map = await Server.getDataFromServer();
    player.name = map['fullName'];
    player.photo = map['imageURL'];
    notifyListeners();
  }

  updatePlayerInfo() {}
  getPlayerInfo() {}
}
