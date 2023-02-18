import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.label, required this.onPressed, super.key});
  final String label;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.04,
        bottom: MediaQuery.of(context).size.height * 0.02,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.06,
        // infinite width
        width: double.infinity,

        child: ElevatedButton(
          // change button color
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0XFFFFA724)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ))),

          onPressed: () {
            onPressed();
          },
          child: Text(
            label,
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.height * 0.024),
          ),
        ),
      ),
    );
  }
}
