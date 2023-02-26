import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pixelated/constants/colors.dart';
import 'package:pixelated/data/web_services/meals_services.dart';
import 'package:pixelated/data/web_services/user_services.dart';
import 'package:pixelated/screens/choose_meal.dart';
import 'package:pixelated/screens/order_details.dart';
import 'package:pixelated/widgets/get_button.dart';

class MealCard extends StatefulWidget {
  const MealCard(
      {super.key,
      required this.index,
      required this.width,
      required this.height});

  @override
  State<MealCard> createState() => _MealCardState();
  final int index;
  final double width;
  final double height;
}

class _MealCardState extends State<MealCard> {
  @override
  Widget build(BuildContext context) {
    //media query

    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Container(
        width: widget.width,
        height: widget.height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: MyColors.myWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 21,
              spreadRadius: -4,
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              MealsServices.getMeals()[widget.index].imageUrl!,
              width: widget.width,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      MealsServices.getMeals()[widget.index].name!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Text(
                  "as offered",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Included:",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      SizedBox(
                        width: widget.width * 0.3,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            MealsServices.getMeals()[widget.index]
                                .included!
                                .toString()
                                .substring(
                                  1,
                                  MealsServices.getMeals()[widget.index]
                                          .included!
                                          .toString()
                                          .length -
                                      1,
                                ),
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GetButton(index: widget.index)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
