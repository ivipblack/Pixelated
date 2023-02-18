// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pixelated/data/models/Meals%20Models/Meat.dart';
import 'package:pixelated/data/web_services/meals_services.dart';

import '../data/models/User.dart';
import '../data/models/order.dart';

class OrdersControl extends StatelessWidget {
  const OrdersControl({
    super.key,
    required this.uid,
  });

  final String uid;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('User').doc(uid).snapshots(),
        builder: (context, userSnapshot) {
          if (userSnapshot.hasData) {
            Users user = Users.fromJson(userSnapshot.data!.data()!);
            return StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('Orders').snapshots(),
              builder: (context, orderSnapshot) {
                if (orderSnapshot.hasData) {
                  List<Orders> orders = [];
                  for (var i = 0; i < orderSnapshot.data!.docs.length; i++) {
                    Orders order =
                        Orders.fromJson(orderSnapshot.data!.docs[i].data());
                    if (order.createdAt.isAfter(
                      DateTime.now().subtract(
                        Duration(days: 1),
                      ),
                    )) {
                      orders.add(order);
                    }
                  }
                  for (var i = 0; i < orders.length; i++) {
                    if (orders[i].customerId == uid) {
                      return Container(
                          width: double.infinity,
                          child:
                              AssignedCard(context, orders, i, orderSnapshot));
                    }
                  }

                  if (user.isAvailable &&
                      user.isVerifiedAsDliverer &&
                      orders.isNotEmpty) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        if (orders[index].status == 'Pending' &&
                            (orders[index].delivererId == '' ||
                                orders[index].delivererId == null) &&
                            orders[index].customerId != uid) {
                          return OrderToDeliverCard(
                              orders, index, orderSnapshot);
                        } else if (orders[index].delivererId == uid) {
                          return AssignedCard(
                              context, orders, index, orderSnapshot);
                        } else {
                          return Container();
                        }
                      },
                    );
                  } else {
                    return Container();
                  }
                }
                return Container();
              },
            );
          }
          return Container();
        });
  }

  Container AssignedCard(BuildContext context, List<Orders> orders, int index,
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> orderSnapshot) {
    return Container(
      width: 300,
      height: 100,
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: -3,
            blurRadius: 6,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Address: " + orders[index].address,
                  style: TextStyle(fontSize: 15),
                ),
                Text(orders[index].status, style: TextStyle(fontSize: 15)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Phone number: ' + orders[index].phoneNumber,
                    style: TextStyle(fontSize: 15)),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Order Details"),
                          content: Column(
                            children: [
                              Text(
                                "Address: " + orders[index].address,
                              ),
                              Text(
                                "Phone number: " + orders[index].phoneNumber,
                              ),
                              Text("Status: " + orders[index].status),
                              Text("Total price: 7.6 SAR"),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Order: \n" +
                                    MealsServices.getMealDetails(
                                      orders[index].meal,
                                    ),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              child: Text("Close"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container OrderToDeliverCard(List<Orders> orders, int index,
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> orderSnapshot) {
    return Container(
      width: 300,
      height: 100,
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: -3,
            blurRadius: 6,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Address: " + orders[index].address,
                  style: TextStyle(fontSize: 15),
                ),
                Text(orders[index].status, style: TextStyle(fontSize: 15)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('Orders')
                        .doc(orderSnapshot.data!.docs[index].id)
                        .update({'delivererId': uid, 'status': 'Assigned'});
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// if (orderSnapshot.data!.docs[index]['status'] ==
//                                 'Pending' &&
//                             orderSnapshot.data!.docs[index]['delivererId'] ==
//                                 null) {
//                           FirebaseFirestore.instance
//                               .collection('Orders')
//                               .doc(orderSnapshot.data!.docs[index].id)
//                               .update(
//                                   {'delivererId': uid, 'status': 'Assigned'});
//                         }
