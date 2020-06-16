import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/User.dart';

class Db {
  static final dbReference = Firestore.instance;
  static Future<DocumentReference> addUser(User user) {
    CollectionReference userCollection = dbReference.collection('users');
    Future<DocumentReference> future = userCollection.add(user.convertToMap());
    return future;
  }

  static Future<QuerySnapshot> readAllRecords() {
    CollectionReference userCollection = dbReference.collection('users');
    Future<QuerySnapshot> querySnapShot = userCollection.getDocuments();
    return querySnapShot;
  }
}
