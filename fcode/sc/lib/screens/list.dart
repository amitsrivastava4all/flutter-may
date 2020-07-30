import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infinitescroll_ads_payments/db/dboperations.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  int fetchRecords = 10;
  DbOperation _db = DbOperation.getInstance();
  Future<List<DocumentSnapshot>> _future;
  ScrollController _sc = ScrollController();
  _scrollCall() {
    setState(() {
      _future = _db.getPaginatedRecords(fetchRecords);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = _db.getPaginatedRecords(fetchRecords);
    _sc.addListener(() {
      print("Calling Scroll");
      if (_sc.position.pixels == _sc.position.maxScrollExtent) {
        print("Inside IF Calling Scroll");
        _scrollCall();
      }
    });
    // first.then((value) => null).catchError((err)=>null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Screen'),
      ),
      body: Container(
        child: FutureBuilder(
          future: _future,
          builder: (BuildContext ctx, AsyncSnapshot shot) {
            if (!shot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else if (shot.hasData) {
              return ListView.builder(
                controller: _sc,
                itemCount: shot.data.length,
                itemBuilder: (c, index) {
                  return ListTile(
                    title: Text(
                      shot.data[index]['name'],
                      style: TextStyle(fontSize: 22),
                    ),
                    subtitle: Text(
                      shot.data[index]['salary'].toString(),
                      style: TextStyle(fontSize: 22),
                    ),
                  );
                },
              );
            } else if (shot.hasError) {}
            return Text('Loading');
          },
        ),
      ),
    );
  }
}
