import 'dart:convert' as json;

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ImageViewer extends StatefulWidget {
  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  _callServer() async {
    String url =
        "http://api.giphy.com/v1/gifs/search?api_key=vFRSFWo6g7vJ7ZAjt3DMDolU52ORTxwH&q=Tom and Jerry&limit=10";
    Response response = await get(url);
    // print(':::::Response is ${response.body}');
    var map = json.jsonDecode(response.body);
    return map;
//    print("Map is ${map.runtimeType}");
//    String url2 = map['data'][0]['images']['original']['url'];
//    print('URL2 ${url2}');
    //return response; // new Future(map)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Image Viewer'),
        ),
        body: FutureBuilder(
            future: _callServer(),
            builder: (BuildContext ctx, AsyncSnapshot snapShot) {
              if (snapShot == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapShot.hasError) {
                return Center(
                    child: Text(
                  'Some Server Issue',
                  style: TextStyle(fontSize: 32),
                ));
              }

              if (snapShot.hasData) {
                print("Data is ::::: ${snapShot.data.length}");
                // Grid Style Code
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Card(
                        child: Image.network(snapShot.data['data'][index]
                            ['images']['original']['url']),
                      );
                    },
                    itemCount: snapShot.data.length,
                    scrollDirection: Axis.vertical);

                // List Style Code
                //            return ListView.builder(
//              //scrollDirection: Axis.horizontal,
//              itemCount: snapShot.data.length,
//              itemBuilder: (parent, index) {
//                return Card(
//                  child: Image.network(snapShot.data['data'][index]['images']
//                      ['original']['url']),
//                );
//              },
//            );
//          }

              }
            }));
  }
}
