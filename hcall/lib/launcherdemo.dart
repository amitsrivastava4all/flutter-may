import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:url_launcher/url_launcher.dart';

class LauncherDemo extends StatefulWidget {
  @override
  _LauncherDemoState createState() => _LauncherDemoState();
}

class _LauncherDemoState extends State<LauncherDemo> {
  File image;

  launchApp(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  camera() async {
    ImagePicker imagePicker = new ImagePicker();
    PickedFile image2 = await imagePicker.getImage(source: ImageSource.camera);
    // ImageSource.gallery
    //File image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      this.image = new File(image2.path);
      //this.image2 = image2;
    });
  }

  var message = '';
  getLatLng() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      message = 'Location Position ${position.latitude} '
          '${position.longitude}';
      // Call Google Map API
    });
  }

  FlutterTts tts = new FlutterTts();
  _readIt() async {
    await tts.setPitch(1); // 0 - 5
    await tts.speak(msg ?? 'Nothing to Speak');
  }

  String msg = "";
  _speakNow() async {
    SpeechToText speechToText = SpeechToText();
    bool micIsAvaliable =
        await speechToText.initialize(onStatus: (String status) {
      setState(() {
        msg = "Mic is Ready";
      });
    }, onError: (SpeechRecognitionError error) {
      setState(() {
        msg = "Some Error in Mic ";
      });
    }); // init code ends
    if (micIsAvaliable) {
      speechToText.listen(onResult: (SpeechRecognitionResult result) {
        setState(() {
          msg = result.recognizedWords;
        });
      });
    } else {
      setState(() {
        msg = "User Denied Mic Access";
      });
    }
    Timer(Duration(seconds: 30), () {
      speechToText.stop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Launcher'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Speak Now'),
              onPressed: () {
                _readIt();
              },
            ),
            RaisedButton(
              child: Text('Mic'),
              onPressed: () {
                _speakNow();
              },
            ),
            Text(
              'Result is $msg',
              style: TextStyle(fontSize: 20),
            ),
            RaisedButton(
              child: Text('Phone'),
              onPressed: () {
                var phone = "tel:+1 555 010 999";
                launchApp(phone);
              },
            ),
            RaisedButton(
              child: Text('SMS'),
              onPressed: () {
                var sms = "sms:5550101234";
                launchApp(sms);
              },
            ),
            RaisedButton(
              child: Text('GPS'),
              onPressed: () {
                getLatLng();
              },
            ),
            Text(
              'GPS $message',
              style: TextStyle(fontSize: 30),
            ),
            RaisedButton(
              child: Text('Camera'),
              onPressed: () {
                camera();
              },
            ),
            image == null
                ? Container(
                    child: Text(
                      'No Image......',
                      style: TextStyle(fontSize: 30),
                    ),
                  )
                : Image.file(
                    image,
                    height: 300,
                    width: 300,
                  )
          ],
        ),
      ),
    );
  }
}
