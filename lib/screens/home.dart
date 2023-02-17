// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pixelated/data/web_services/meals_services.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
          child: Column(
            children: [
              StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('Test').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data!.docs[0]['Testing'],
                    );
                  } else {
                    return Container(
                      child: Text('Loading'),
                    );
                  }
                },
              ),
              Card(
                child: SafeArea(
                  child: Container(
                    width: 250,
                    height: 600,
                    color: Colors.amber,
                    child: Column(
                      children: [
                        for (var i = 0;
                            i < MealsServices.getMeals().length;
                            i++)
                          Container(
                            child: Column(
                              children: [
                                Text(
                                  MealsServices.getMeals()[i].name!,
                                ),
                                Text(
                                  MealsServices.getMeals()[i].description!,
                                ),
                                Image.asset(
                                  MealsServices.getMeals()[i].imageUrl!,
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
        ));
  }
}
