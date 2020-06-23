import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utils/db.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDO List'),
      ),
      body: FutureBuilder(
        builder: (BuildContext ctx, AsyncSnapshot<QuerySnapshot> snapShot) {
          if (!snapShot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapShot.hasError) {
            return Center(
              child: Text('Some Error Occur During Data Fetch'),
            );
          }
          return ListView.builder(
              itemCount: snapShot.data.documents.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapShot.data.documents[index]['name']),
                  subtitle: Text(snapShot.data.documents[index]['descr']),
                );
              });
        },
        future: Db.getAllRecordsForFuture(),
      ),
      /*
        body: FutureBuilder(
          builder: (BuildContext ctx, AsyncSnapshot<QuerySnapshot> snapShot) {
            if (!snapShot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            //print(".....Snap Shot is ${snapShot.data.documents}");

            //print(snapShot.data.documents[0]["name"]);
            return ListView(
              children: snapShot.data.documents.map((document) {
                //print("Inside Map Data is ${document}");
                return ListTile(
                  title: Text(document['name']),
                  subtitle: Text(document['descr']),
                );
              }).toList(),
            );
          },
          future: Db.getAllRecordsForFuture(),
        )
        */
      /* body: StreamBuilder(
          stream: Db.getAllRecordsOfToDo(),
          builder: (BuildContext ctx, AsyncSnapshot<QuerySnapshot> snapShot) {
            if (!snapShot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            // Data Present
            return ListView(
              children: snapShot.data.documents.map((document) {
                return ListTile(
                  title: Text(document['name']),
                  subtitle: Text(document['descr']),
                );
              }).toList(),
            );
          }), */
    );
  }
}
