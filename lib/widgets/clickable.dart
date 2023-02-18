import 'package:flutter/material.dart';

class Clickable extends StatelessWidget {
  final String text;
  final Function() theFunction;

  const Clickable({
    super.key,
    required this.text,
    required this.theFunction,
  });

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.fromLTRB(60, 60, 60, 60),
    //   child: Material(
    //     borderRadius: BorderRadius.circular(30),
    //     elevation: 5,
    //     color: const Color.fromARGB(255, 255, 167, 36),
    //     child: MaterialButton(
    //       // height: 50,
    //       // minWidth: 50,
    //       onPressed: theFunction,
    //       child: Text(
    //         text,
    //         style: const TextStyle(
    //             fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
    //       ),
    //     ),
    //   ),
    // );
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 30, 185, 0),
          child: SizedBox(
            child: ElevatedButton(
              // change button color
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0XFFFFA724)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ))),

              onPressed: () {
                theFunction();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.height * 0.016),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
