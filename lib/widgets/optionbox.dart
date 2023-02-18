// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

import 'clickable.dart';

class OptionBox extends StatelessWidget {
  final String buttonText;
  final String image;
  final Function fun;

  const OptionBox({
    super.key,
    required this.buttonText,
    required this.image,
    required this.fun,
  });

  @override
  Widget build(BuildContext context) {
    //whole card
    return Container(
      // color: Colors.red,
      height: 420,
      // width: 400,
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              child: Clickable(
                  text: buttonText,
                  theFunction: () {
                    fun();
                  }),
              height: MediaQuery.of(context).size.height * 0.18,
              width: MediaQuery.of(context).size.width * 0.88,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ),
          // Big light background
          // Positioned(
          //   right: 20,
          //   bottom: 0,
          //   child: Container(
          //     child: Clickable(text: buttonText, theFunction: () {}),
          //     height: MediaQuery.of(context).size.height * 0.17,
          //     width: MediaQuery.of(context).size.width * 0.85,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(32),
          //       color: Colors.white.withOpacity(0.6),
          //     ),
          //   ),
          // ),
          // Food Image
          Positioned(
            bottom: 109,
            // top: -80,
            // left: 10,
            right: -40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 320,
                  width: 320,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Positioned(
          //   // top: ,
          //   bottom: 80,
          //   left: 10,
          //   // right: 10,
          //   child: Container(
          //     height: 350,
          //     width: 350,
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage(image),
          //       ),
          //     ),
          //   ),
          // ),
          // Price
          // Positioned(
          //   top: 300,
          //   right: 120,
          //   child: Clickable(text: buttonText, theFunction: () {}),
          // ),
        ],
      ),
    );
  }
}
