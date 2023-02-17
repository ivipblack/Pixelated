import 'package:cloud_firestore/cloud_firestore.dart';

class OrderServices {
  final db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getUserInfo(String uid) {
    return db.collection('User').where('uid', isEqualTo: uid).snapshots();
  }
}
