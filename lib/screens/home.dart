// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    return Container(
        child: ElevatedButton(
      onPressed: () {
        FirebaseAuth.instance.signOut();
      },
      child: Center(child: const Text('Get Meals')),
    ));
  }
}
