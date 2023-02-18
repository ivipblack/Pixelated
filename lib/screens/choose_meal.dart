// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:pixelated/constants/colors.dart';
import '../data/web_services/meals_services.dart';
import 'order_details.dart';

class ChooseMeal extends StatefulWidget {
  const ChooseMeal({super.key});

  @override
  State<ChooseMeal> createState() => _ChooseMealState();
}

class _ChooseMealState extends State<ChooseMeal> {
  @override
  Widget build(BuildContext context) {
    // media query
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a Meal', style: TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: MealsServices.getMeals().length,
              itemBuilder: (context, index) {
                return mealCard(width, height, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding mealCard(double width, double height, int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 18, 30, 18),
      child: Container(
        width: width,
        height: height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 0),
              blurRadius: 21,
              spreadRadius: -4,
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              MealsServices.getMeals()[index].imageUrl!,
              width: width,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      MealsServices.getMeals()[index].name!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Text(
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Included:",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      SizedBox(
                        width: width * 0.3,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            MealsServices.getMeals()[index]
                                .included!
                                .toString()
                                .substring(
                                  1,
                                  MealsServices.getMeals()[index]
                                          .included!
                                          .toString()
                                          .length -
                                      1,
                                ),
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderDetails(),
                        ),
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
                          'Get',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
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
