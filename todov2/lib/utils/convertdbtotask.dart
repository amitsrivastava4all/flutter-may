import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loginwithfirebase/models/task.dart';

import 'db.dart';

class Convert {
  static Future<List<Task>> convertDBToTask() async {
    QuerySnapshot obj = await Db.getAllRecordsForFuture();
    List<Task> tasks = [];
    obj.documents.forEach((doc) {
      tasks.add(new Task(doc['name'], doc['descr']));
    });
    return tasks;
  }
}
