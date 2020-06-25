import 'package:flutter/material.dart';
import 'package:loginwithfirebase/models/task.dart';
import 'package:loginwithfirebase/utils/convertdbtotask.dart';

import './add.dart';

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.add, size: 30),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((route) => Add())));
        },
      ),
      body: FutureBuilder(
        future: Convert.convertDBToTask(),
        builder: (BuildContext ctx, AsyncSnapshot<List<Task>> snapShot) {
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
              itemCount: snapShot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  trailing: Container(
                    width: 50,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            // var currentId =
                            //    snapShot.data.documentID;
                          },
                          icon: Icon(Icons.delete,
                              size: 30, color: Colors.redAccent),
                        )
                      ],
                    ),
                  ),
                  title: Text(snapShot.data[index].name),
                  subtitle: Text(snapShot.data[index].desc),
                );
              });
        },

        // future: Db.getAllRecordsForFuture(),
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
