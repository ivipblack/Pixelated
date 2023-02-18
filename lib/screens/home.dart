// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pixelated/constants/colors.dart';
import 'package:pixelated/screens/choose_meal.dart';

import '../widgets/optionbox.dart';
import 'order_details.dart';

const List<String> list = <String>['822', '823', '824', '825', '826', '827'];
// make another list for numbers starting from 101-121
const List<String> list2 = <String>['101', '102', '103', '104', '105', '106'];

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
    String dropdownValue = list.first;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.5, 0.9],
          colors: [
            MyColors.myCream,
            MyColors.myWhite,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Welcome',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 585,
              // color: Colors.blue,
              child: Stack(
                children: [
                  OptionBox(
                    buttonText: 'Order',
                    image: 'assets/order.png',
                    fun: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChooseMeal(),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    // height: 200,
                    width: width * 0.9,
                    // height:
                    // width: 4,
                    top: height * 0.35,
                    left: 24,
                    // left: width * 0.1,
                    // bottom: height * 0.1,
                    child: OptionBox(
                      buttonText: 'Deliver',
                      image: 'assets/delivary.png',
                      fun: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
