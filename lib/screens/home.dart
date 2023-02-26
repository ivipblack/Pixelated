// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pixelated/constants/colors.dart';
import 'package:pixelated/data/view_models/homeVm.dart';
import 'package:pixelated/screens/choose_meal.dart';
import '../data/models/user.dart';
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
    HomeVm homeVm = HomeVm();

    return Scaffold(
      backgroundColor: MyColors.myCream,
      appBar: AppBar(
        title: const Text(
          'Order',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        backgroundColor: MyColors.myCream,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(width * 0.27, 0, 30, 0),
            child: Container(
              width: 150,
              decoration: BoxDecoration(
                color: MyColors.myWhite,
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
                          hasAddress = true;
                          return SizedBox(
                            height: 20,
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    child: SizedBox(
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
                                              items: homeVm.listOfBuildings
                                                  .map(
                                                    (e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e.toString()),
                                                    ),
                                                  )
                                                  .toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  homeVm.building =
                                                      value.toString();
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
                                              items: homeVm.listOfRooms
                                                  .map(
                                                    (e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e.toString()),
                                                    ),
                                                  )
                                                  .toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  homeVm.room =
                                                      value.toString();
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
                                                  "${homeVm.building!} - ${homeVm.room!}",
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
                                                  color: MyColors.myWhite,
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
                          hasAddress = false;
                          return SizedBox(
                            height: 20,
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    child: SizedBox(
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
                                              items: homeVm.listOfBuildings
                                                  .map(
                                                    (e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e.toString()),
                                                    ),
                                                  )
                                                  .toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  homeVm.building =
                                                      value.toString();
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
                                              items: homeVm.listOfRooms
                                                  .map(
                                                    (e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e.toString()),
                                                    ),
                                                  )
                                                  .toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  homeVm.room =
                                                      value.toString();
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
                                                  "${homeVm.building!} - ${homeVm.room!}",
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
      body: ChooseMeal(),
    );
  }
}
