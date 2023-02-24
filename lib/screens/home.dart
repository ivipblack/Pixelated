// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../data/models/User.dart';
import '../data/web_services/user_services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    String? room;
    String? building;
    // make a list of int from 810 to 860
    final List<int> listOfBuildings = List<int>.generate(50, (i) => 810 + i);
    final List<int> listOfRooms = [
      101,
      102,
      103,
      104,
      105,
      106,
      107,
      108,
      109,
      110,
      111,
      112,
      113,
      114,
      115,
      116,
      117,
      118,
      119,
      120,
      121,
      122,
      123,
      124,
      124,
      125,
      201,
      202,
      203,
      204,
      205,
      206,
      207,
      208,
      209,
      210,
      211,
      212,
      213,
      214,
      215,
      216,
      217,
      218,
      219,
      220,
      221,
      222,
      223,
      224,
      225,
      301,
      302,
      303,
      304,
      305,
      306,
      307,
      308,
      309,
      310,
      311,
      312,
      313,
      314,
      315,
      316,
      317,
      318,
      319,
      320,
      321,
      322,
      323,
      324,
      325,
    ];

    bool isAvailable = true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              width: 150,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      'Delivery Location:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('User')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                    builder:
                        (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasData) {
                        Users user = Users.fromJson(
                            snapshot.data!.data()! as Map<String, dynamic>);
                        if (user.defaultAddress != null &&
                            user.defaultAddress != "") {
                          return SizedBox(
                            height: 20,
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    child: Container(
                                      height: height * 0.4,
                                      width: width * 0.8,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 20, 20, 20),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Choose Another Address",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            // choose building
                                            DropdownButtonFormField(
                                              decoration: const InputDecoration(
                                                labelText: 'Building',
                                              ),
                                              items: listOfBuildings
                                                  .map(
                                                    (e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e.toString()),
                                                    ),
                                                  )
                                                  .toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  building = value.toString();
                                                });
                                              },
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            // choose room
                                            DropdownButtonFormField(
                                              decoration: const InputDecoration(
                                                labelText: 'Room',
                                              ),
                                              items: listOfRooms
                                                  .map(
                                                    (e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e.toString()),
                                                    ),
                                                  )
                                                  .toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  room = value.toString();
                                                });
                                              },
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                UserServices.addAddressToUser(
                                                  FirebaseAuth.instance
                                                      .currentUser!.uid,
                                                  "${building!} - ${room!}",
                                                );
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: const Text(
                                                      'Address Added',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                height: 40,
                                                width: 200,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    'Add',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                user.defaultAddress!,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          );
                        } else {
                          // show a dialog box to add address
                          return SizedBox(
                            height: 20,
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    child: Container(
                                      height: height * 0.4,
                                      width: width * 0.8,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 20, 20, 20),
                                        child: Column(
                                          children: [
                                            const Text(
                                              'Add Address',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            // choose building
                                            DropdownButtonFormField(
                                              decoration: const InputDecoration(
                                                labelText: 'Building',
                                              ),
                                              items: listOfBuildings
                                                  .map(
                                                    (e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e.toString()),
                                                    ),
                                                  )
                                                  .toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  building = value.toString();
                                                });
                                              },
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            // choose room
                                            DropdownButtonFormField(
                                              decoration: const InputDecoration(
                                                labelText: 'Room',
                                              ),
                                              items: listOfRooms
                                                  .map(
                                                    (e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e.toString()),
                                                    ),
                                                  )
                                                  .toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  room = value.toString();
                                                });
                                              },
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                UserServices.addAddressToUser(
                                                  FirebaseAuth.instance
                                                      .currentUser!.uid,
                                                  "${building!} - ${room!}",
                                                );
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: const Text(
                                                      'Address Added',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                height: 40,
                                                width: 200,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    'Add',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: const Text(
                                'Add Address',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          );
                        }
                      } else {
                        return const Text(
                          'Loading...',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
