// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    return Container(
        child: Container(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('Test').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    uid,
                  );
                } else {
                  return Container(
                    child: Text('Loading'),
                  );
                }
              }),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
        ));
  }
}
