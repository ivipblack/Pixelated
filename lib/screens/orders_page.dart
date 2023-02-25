// ignore_for_file: unused_local_variable, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pixelated/constants/colors.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';

import '../data/models/User.dart';
import '../data/models/order.dart';
import '../widgets/orders_control.dart';
import '../widgets/recieve_delivery_orders.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      backgroundColor: MyColors.myCream,
      appBar: AppBar(
        title: Text('Orders', style: TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        // switcher
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OrdersControl(uid: uid),
          // If the deliverer is verified, it will show the switcher to recieve orders
          //otherwise it will be empty
          recieveDeliveryOrders(uid: uid),
        ],
      ),
    );
  }
}
