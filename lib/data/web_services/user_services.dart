import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/User.dart';

class UserServices {
  static Future<Users> getUserById(String id) async {
    User? user;
    try {
      final user = await FirebaseFirestore.instance
          .collection('User')
          .doc(id)
          .get()
          .then((value) => Users.fromJson(value.data()!));
      return user;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  // check if user is available
  static Future<bool> isUserAvailable(String id) async {
    try {
      final user = await FirebaseFirestore.instance
          .collection('User')
          .doc(id)
          .get()
          .then((value) => Users.fromJson(value.data()!));
      return user.isAvailable;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  // add address to user
  static Future<void> addAddressToUser(String id, String address) async {
    try {
      await FirebaseFirestore.instance
          .collection('User')
          .doc(id)
          .update({'defaultAddress': address});
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
