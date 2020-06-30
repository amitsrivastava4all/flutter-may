import 'package:flutter/material.dart';
import 'package:loginwithfirebase/models/task.dart';
import 'package:loginwithfirebase/screens/edit.dart';
import 'package:loginwithfirebase/utils/convertdbtotask.dart';
import 'package:loginwithfirebase/utils/db.dart';

import './add.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  int countDown = 0;
  countMarkRecords() {
    List<Task> taskList = Convert.getTasks();
    return taskList.where((task) => task.isMarked).length;
//    for (int i = 0; i < taskList.length; i++) {
//     if(taskList[i].isMarked){
//       countDown++;
//     }
//    }
//    return countDown;
  }

  edit(String currentId) {
    List<Task> taskList = Convert.getTasks();
    Task taskObject =
        taskList.where((task) => task.id == currentId).toList()[0];
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => Edit(taskObject, callParent)));
  }

  markRecord(id) {
    bool flag = false;
    List<Task> taskList = Convert.getTasks();
    for (int i = 0; i < taskList.length; i++) {
      if (taskList[i].id == id) {
        flag = true;
        taskList[i].isMarked = !taskList[i].isMarked;
      }
    }
    if (flag) {
      setState(() {
        Convert.setTasks(taskList);
        countDown = countMarkRecords();
      });
    }
  }

  _deleteMarkRecords() {
    List<Task> taskList = Convert.getTasks();
    List<Task> subList = taskList.where((task) => task.isMarked).toList();
    List<String> allIds = subList.map((task) => task.id).toList();
    Db.deleteMarkRecords(allIds);
    Convert.setTasks(null);
    setState(() {
      countDown = 0;
    });
  }

  callParent() {
    print("Call Parent Invoke......");
    setState(() {
      countDown = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("TO Do LIST BUILD RUN.......");
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDO List Mark records $countDown'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _deleteMarkRecords();
            },
            icon: Icon(
              Icons.delete_forever,
              size: 35,
              color: Colors.redAccent,
            ),
          )
        ],
        //flexibleSpace: Text('Total Mark Records $countDown'),
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
                return Container(
                  color: snapShot.data[index].isMarked
                      ? Colors.lime
                      : Colors.white,
                  child: ListTile(
                    trailing: Container(
                      //color: snapShot.data[index].isMarked
                      // ? Colors.lime
                      // : Colors.white,
                      width: 100,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              var currentId = snapShot.data[index].id;
                              print("Current Id is $currentId");
                              markRecord(currentId);
                            },
                            icon: Icon(Icons.delete,
                                size: 30, color: Colors.redAccent),
                          ),
                          IconButton(
                            onPressed: () {
                              var currentId = snapShot.data[index].id;
                              edit(currentId);
                            },
                            icon: Icon(Icons.edit,
                                size: 30, color: Colors.blueAccent),
                          )
                        ],
                      ),
                    ),
                    title: Text(snapShot.data[index].name),
                    subtitle: Text(snapShot.data[index].desc),
                  ),
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
