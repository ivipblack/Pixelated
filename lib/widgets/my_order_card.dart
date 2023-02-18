// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../constants/colors.dart';
import '../data/models/order.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyOrderCard extends StatelessWidget {
  const MyOrderCard({
    super.key,
    required this.orders,
    required this.i,
  });

  final List<Orders> orders;
  final int i;

  // permission handler
  Future<void> _makePhoneCall(String number) async {
    if (await Permission.phone.request().isGranted) {
      await FlutterPhoneDirectCaller.callNumber(number);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
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
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Your Order',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      orders[i].status,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: orders[i].status == 'Pending'
                              ? Colors.orange
                              : orders[i].status == 'Accepted'
                                  ? Colors.green
                                  : Colors.green),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    orders[i].status == 'Pending'
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.orange,
                              strokeWidth: 1,
                            ),
                          )
                        : orders[i].status == 'Accepted'
                            ? Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              )
                            : Container()
                  ],
                ),
              ],
            ),
            Divider(
              color: Color.fromARGB(255, 223, 223, 223),
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Deliver to: ' + orders[i].address,
                    style: TextStyle(fontSize: 15)),
                Row(
                  children: [
                    // if order is assigned show the phone number of the deliverer
                    orders[i].status == 'Assigned'
                        ? InkWell(
                            onTap: () {
                              _makePhoneCall(orders[i].delivererPhoneNumber!);
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
                              content: Column(
                                children: [
                                  Text(
                                    "Address: " + orders[i].address,
                                  ),
                                  Text(
                                    "Phone number: " + orders[i].phoneNumber,
                                  ),
                                  Text("Status: " + orders[i].status),
                                  Text("Total price: 7.6 SAR"),
                                  Text("Order ID: " + orders[i].orderId),
                                ],
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
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
