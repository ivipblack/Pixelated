// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pixelated/data/models/Meals%20Models/Meat.dart';
import 'package:pixelated/data/web_services/meals_services.dart';
import 'package:pixelated/data/web_services/user_services.dart';
import 'package:intl/intl.dart';
import '../constants/colors.dart';
import '../data/models/user.dart';
import '../data/models/order.dart';
import 'assignedCard.dart';
import 'my_order_card.dart';

class OrdersControl extends StatelessWidget {
  OrdersControl({
    super.key,
    required this.uid,
  });

  final String uid;
  Future<void> _makePhoneCall(String number) async {
    if (await Permission.phone.request().isGranted) {
      await FlutterPhoneDirectCaller.callNumber(number);
    }
  }

  Users? user;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('User').doc(uid).snapshots(),
        builder: (context, userSnapshot) {
          if (userSnapshot.hasData) {
            user = Users.fromJson(userSnapshot.data!.data()!);
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
                    // for (var i = 0; i < orders.length; i++) {
                    //   if (orders[i].customerId == uid) {
                    //     return MyOrderCard(orders: orders, i: i);
                    //   }
                    // }

                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: orders.length,
                        itemBuilder: (context, index) {
                          if (orders[index].customerId == uid) {
                            return MyOrderCard(orders: orders, i: index);
                          }
                          if (user!.isAvailable &&
                              user!.isVerifiedAsDliverer &&
                              orders.isNotEmpty) {
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
                          }
                        },
                      ),
                    );
                  } else {
                    return Container();
                  }
                });
          }
          return Container();
        });
  }

  Container AssignedCard(BuildContext context, List<Orders> orders, int index,
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> orderSnapshot) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: 300,
      height: 120,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Deliver to: ${orders[index].address}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(orders[index].status,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Divider(
              color: Color.fromARGB(255, 223, 223, 223),
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    // if order is assigned show the phone number of the deliverer
                    orders[index].status == 'Assigned'
                        ? InkWell(
                            onTap: () {
                              _makePhoneCall(
                                  orders[index].delivererPhoneNumber!);
                            },
                            child: Container(
                              height: 26,
                              width: 26,
                              decoration: BoxDecoration(
                                color: MyColors.myOrange,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child: Icon(
                                  FontAwesomeIcons.phone,
                                  color: Colors.black,
                                  size: 14,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Order Details"),
                              content: Container(
                                height: height * 0.5,
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // write delivery to in bold and the address in normal
                                        Text(
                                          "Delivery to: " +
                                              orders[index].address,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Phone number: " +
                                              orders[index].phoneNumber,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Order time: " +
                                              // show only time year and month and day
                                              DateFormat('yyyy-MM-dd – kk:mm')
                                                  .format(
                                                      orders[index].createdAt),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Order: " +
                                              MealsServices.getMealDetails(
                                                orders[index].meal,
                                              ),
                                        ),
                                        Text(
                                            "Bevarage: " + orders[index].drink),
                                        Text("Side: " + orders[index].salad),
                                        Text("Sweet: " + orders[index].sweet),
                                        Text("Special instructions: " +
                                            orders[index].prefers!),
                                        SizedBox(
                                          height: 10,
                                        ),

                                        Text(
                                          "Total price: 7.6 SAR",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "The order is marked as PAID",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Please check that you recieved the payment",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        orders[index].status == 'Assigned'
                                            ? InkWell(
                                                onTap: () {
                                                  // change the status of the order to delivered
                                                  FirebaseFirestore.instance
                                                      .collection('Orders')
                                                      .doc(orderSnapshot
                                                          .data!.docs[index].id)
                                                      .update({
                                                    'status': 'Delivered',
                                                  });
                                                },
                                                child: Container(
                                                  height: 26,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    color: MyColors.myOrange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    'Delivered',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  )),
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 26,
                        width: 85,
                        decoration: BoxDecoration(
                          color: MyColors.myOrange,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            'More',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        orders[index].status == 'Assigned'
                            ? InkWell(
                                onTap: () {
                                  // change the status of the order to delivered
                                  FirebaseFirestore.instance
                                      .collection('Orders')
                                      .doc(orderSnapshot.data!.docs[index].id)
                                      .update({
                                    'status': 'Delivered',
                                  });
                                },
                                child: Container(
                                  height: 26,
                                  width: 85,
                                  decoration: BoxDecoration(
                                    color: MyColors.myOrange,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Delivered!',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
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
