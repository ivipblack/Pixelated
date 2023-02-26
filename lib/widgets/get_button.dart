import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pixelated/constants/colors.dart';
import 'package:pixelated/data/web_services/meals_services.dart';
import 'package:pixelated/data/web_services/user_services.dart';
import 'package:pixelated/screens/choose_meal.dart';
import 'package:pixelated/screens/order_details.dart';

class GetButton extends StatefulWidget {
  const GetButton({super.key, required this.index});

  @override
  State<GetButton> createState() => _GetButtonState();
  final int index;
}

class _GetButtonState extends State<GetButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        UserServices.hasDefaultAddress(FirebaseAuth.instance.currentUser!.uid)
            .then((value) {
          setState(() {
            hasAddress = value;
          });
        });
        if (hasAddress!) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderDetails(
                meal: MealsServices.getMeals()[widget.index],
              ),
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('No Address specified'),
                content: const Text('Please add an address to continue'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      },
      child: Container(
        height: 26,
        width: 85,
        decoration: BoxDecoration(
          color: MyColors.myOrange,
          borderRadius: BorderRadius.circular(25),
        ),
        child: const Center(
          child: Text(
            'Get',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
