import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/order.dart';

class OrderServices {
  final db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getUserInfo(String uid) {
    return db.collection('User').where('uid', isEqualTo: uid).snapshots();
  }

  // add order to the database
  static Future<void> addOrder(Orders order) async {
    await FirebaseFirestore.instance
        .collection('Orders')
        .doc()
        .set(order.toJson());
  }
}
