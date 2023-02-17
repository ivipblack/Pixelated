import 'package:flutter/material.dart';
// import firebase
import 'package:firebase_auth/firebase_auth.dart';

class OrderDetails extends StatelessWidget {
  OrderDetails({super.key});
  String userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,

          title: const Text(
            'Finalizing',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
          ),
          //make a back button
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            // make a button to logout from firebase
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text(userId),
            ),
          ],
        ));
  }
}
