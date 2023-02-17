import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../data/web_services/meals_services.dart';

class ChooseMeal extends StatefulWidget {
  const ChooseMeal({super.key});

  @override
  State<ChooseMeal> createState() => _ChooseMealState();
}

class _ChooseMealState extends State<ChooseMeal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Meal'),
      ),
    );
  }
}
