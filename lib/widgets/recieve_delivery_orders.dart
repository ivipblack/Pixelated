import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';

import '../constants/colors.dart';

class recieveDeliveryOrders extends StatelessWidget {
  const recieveDeliveryOrders({
    super.key,
    required this.uid,
  });

  final String uid;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('User').doc(uid).get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!['isVerifiedAsDliverer'] == true) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Recieve Delivery Orders'),
                  SizedBox(
                    width: width * 0.1,
                  ),
                  Switcher(
                    value: snapshot.data!['isAvailable'],
                    onChanged: (value) {
                      FirebaseFirestore.instance
                          .collection('User')
                          .doc(uid)
                          .update({'isAvailable': value});
                    },
                    colorOn: MyColors.myOrange,
                    colorOff: Colors.grey,
                    size: SwitcherSize.small,
                  ),
                ],
              );
            } else
              return Container();
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
