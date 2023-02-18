// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pixelated/screens/choose_meal.dart';

import '../widgets/optionbox.dart';
import 'order_details.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/wallpaper.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.09,
              ),
              Container(
                height: 620,
                // color: Colors.red,
                child: Stack(
                  children: [
                    OptionBox(
                      buttonText: 'Order',
                      image: 'assets/order.png',
                      fun: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChooseMeal(),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      top: height * 0.39,
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
      ),
    );
  }
}
