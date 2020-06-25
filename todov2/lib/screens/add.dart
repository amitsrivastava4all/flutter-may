import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/task.dart';
import '../utils/db.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  var selectedDateValue = "";

  TextEditingController taskNameCtrl = TextEditingController();
  TextEditingController taskDescCtrl = TextEditingController();
  BuildContext buildCtx;
  _showDialog() {
    var media = MediaQuery.of(buildCtx).size;
    return AlertDialog(
      title: Text('Add Dialog'),
      backgroundColor: Colors.greenAccent,
      elevation: 5,
      content: Container(
        height: media.height / 3,
        child: Column(
          children: <Widget>[
            Text(
              'Record Added SuccessFully',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Icon(
            Icons.close,
            size: 20,
          ),
          onPressed: () {
            Navigator.of(buildCtx).pop();
          },
        )
      ],
    );
  }

  saveToDb() {
    Task task = new Task(taskNameCtrl.text, taskDescCtrl.text);
    task.date = selectedDateValue;
    Future<DocumentReference> future = Db.addTask(task);
    future.then((ref) {
      showDialog(context: buildCtx, builder: (ctx) => _showDialog());
    }).catchError((err) {
      print("Error in Add $err");
    });
  }

  chooseDate(BuildContext ctx) {
    Future<DateTime> dateTime = showDatePicker(
        context: ctx,
        initialDate: DateTime.now(),
        firstDate: DateTime(2010, 1),
        lastDate: DateTime(2030, 1));
    dateTime.then((selectedDate) {
      setState(() {
        selectedDateValue = selectedDate.toString();
      });
    }).catchError((err) {});
  }

  @override
  Widget build(BuildContext context) {
    buildCtx = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: 'Type Task Name Here', hintText: 'Task Name'),
              controller: taskNameCtrl,
            ),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                  labelText: 'Type Task Desc Here', hintText: 'Task Descr'),
              controller: taskDescCtrl,
            ),
            Row(
              children: <Widget>[
                Text(selectedDateValue),
                RaisedButton(
                  onPressed: () {
                    chooseDate(context);
                  },
                  child: Icon(
                    Icons.calendar_today,
                    size: 30,
                  ),
                )
              ],
            ),
            RaisedButton(
              child: Text('Add'),
              onPressed: () {
                saveToDb();
              },
            )
          ],
        ),
      ),
    );
  }
}
