import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  // late User user;
  final CollectionReference customerCollection =
      FirebaseFirestore.instance.collection('Customer');
  Future updateUserData(
      String email, String name, String city, String phoneNumber) async {
    // user = user(
        // customerID: uid,
        // email: email,
        // phone: phoneNumber,
        // );
    // return await customerCollection.doc(uid).set(customer.toJson());
  }
}
