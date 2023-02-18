// import firebase
import 'package:firebase_auth/firebase_auth.dart';
// import firebase auth
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../screens/login/utils.dart';
import 'database.dart';

final formKey = GlobalKey<FormState>();

Future signUp(
    context, String email, String password, String phoneNumber) async {
  // final isValid = formKey.currentState!.validate();
  // if (!isValid) return;

  showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;

    await DatabaseService(uid: user!.uid).updateUserData(email, phoneNumber);
  } on FirebaseAuthException catch (e) {
    print(e.toString());
    Utils.showSnackBar(e.message);
  }
  navigatorKey.currentState!.popUntil((route) => route.isFirst);
}
