import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loginwithfirebase/models/task.dart';

import 'db.dart';

class Convert {
  static List<Task> taskList;

  static List<Task> getTasks() {
    return taskList;
  }

  static void setTasks(List<Task> tasks) {
    taskList = tasks;
  }

  static Future<List<Task>> convertDBToTask() async {
    if (taskList != null) {
      return taskList;
    }

    QuerySnapshot obj = await Db.getAllRecordsForFuture();
    List<Task> tasks = [];
    obj.documents.forEach((doc) {
      Task task = new Task(doc['name'], doc['descr']);
      task.id = doc.documentID;
      tasks.add(task);
      //tasks.add(new Task(doc['name'], doc['descr']));
    });
    taskList = tasks;
    return taskList;
  }
}
