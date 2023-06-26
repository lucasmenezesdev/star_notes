import 'package:cloud_firestore/cloud_firestore.dart';

class DBFirestoreService {
  DBFirestoreService._();
  static final _instance = DBFirestoreService._();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static get() {
    return DBFirestoreService._instance._firestore;
  }
}
