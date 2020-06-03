import 'dart:convert' as decode;

import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/songmodel.dart';

class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  List<Song> songs = [];
  initState() {
    super.initState();
    _callServer();
  }

  _callServer() async {
    String url = "https://itunes.apple.com/search?term=sonu nigam&limit=25";
    Response response = await get(url);
    print(response.body);
    Map<String, dynamic> map = decode.jsonDecode(response.body);
    var allSongs = map['results'];
    allSongs.forEach((singleSong) {
      Song song = new Song(singleSong['trackName'], singleSong['artworkUrl100'],
          singleSong['previewUrl'], singleSong['artistName']);
      songs.add(song);
    });
    setState(() {
      songs = songs;
    });
    print("Songs are $songs");
    //print(map['results'][1]['previewUrl']);
  }

  AudioPlayer audioPlayer = new AudioPlayer();
  _playSong(Song song) {
    audioPlayer.stop();
    if (!song.isPlaying) {
      audioPlayer.play(song.audio);
    }
  }

  _stopSong() {
    audioPlayer.stop();
  }

  _listChild(Song song) {
    return ListTile(
      leading: Image.network(song.photo),
      title: Text(song.title),
      subtitle: Text(song.artistName),
      trailing: IconButton(
          icon: Icon(
            song.isPlaying
                ? Icons.pause_circle_filled
                : Icons.play_circle_filled,
            size: 40,
            color: Colors.redAccent,
          ),
          onPressed: () {
            _playSong(song);
            setState(() {
              song.isPlaying = !song.isPlaying;

              songs.forEach((currentSong) {
                if (currentSong != song) {
                  currentSong.isPlaying = false;
                }
              });
            });
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return _listChild(songs[index]);
          },
          itemCount: songs.length,
        ),
        // Static
//          child: ListView(
//        children: <Widget>[
//          _listChild('Ram'),
//          _listChild('Shyam'),
//          _listChild('Ram'),
//          _listChild('Shyam'),
//          _listChild('Ram'),
//          _listChild('Shyam'),
//          _listChild('Ram'),
//          _listChild('Shyam'),
//          _listChild('Ram'),
//          _listChild('Shyam'),
//          _listChild('Ram'),
//          _listChild('Shyam'),
//          _listChild('Ram'),
//          _listChild('Shyam'),
//          _listChild('Ram'),
//          _listChild('Shyam'),
//          _listChild('Ram'),
//          _listChild('Shyam'),
//          _listChild('Ram'),
//          _listChild('Shyam'),
//          _listChild('Ram'),
//          _listChild('Shyam'),
//          _listChild('Ram'),
//          _listChild('Shyam'),
//          _listChild('Ram'),
//          _listChild('Shyam'),
//          _listChild('Ram'),
//          _listChild('Shyam'),
//          _listChild('Ram'),
//          _listChild('Shyam'),
//          _listChild('Ram'),
//          _listChild('Shyam'),
//        ],
//      )
      ),
    );
  }
}
