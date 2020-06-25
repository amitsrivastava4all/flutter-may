import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/User.dart';
import '../models/task.dart';

class Db {
  static final dbReference = Firestore.instance;
  static Future<DocumentReference> addUser(User user) {
    CollectionReference userCollection = dbReference.collection('users');
    Future<DocumentReference> future = userCollection.add(user.convertToMap());
    return future;
  }

  static Future<DocumentReference> addTask(Task task) {
    CollectionReference userCollection = dbReference.collection('todo');
    Future<DocumentReference> future = userCollection.add(task.convertToMap());
    return future;
  }

  static Future<QuerySnapshot> readAllRecords() {
    CollectionReference userCollection = dbReference.collection('users');
    Future<QuerySnapshot> querySnapShot = userCollection.getDocuments();
    return querySnapShot;
  }

  static Stream<QuerySnapshot> getAllRecordsOfToDo() {
    return dbReference.collection('todo').snapshots();
  }

  static Future<QuerySnapshot> getAllRecordsForFuture() {
    return dbReference.collection('todo').getDocuments();
  }
}
