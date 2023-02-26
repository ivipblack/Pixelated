import 'package:flutter/material.dart';
import 'package:pixelated/constants/colors.dart';
import 'package:pixelated/widgets/meal_card.dart';
import '../data/web_services/meals_services.dart';

class ChooseMeal extends StatefulWidget {
  const ChooseMeal({super.key});

  @override
  State<ChooseMeal> createState() => _ChooseMealState();
}

bool? hasAddress;

class _ChooseMealState extends State<ChooseMeal> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: MyColors.myCream,
      body: Column(
        children: [
          SizedBox(height: height * 0.01),
          Expanded(
            child: ListView.builder(
              itemCount: MealsServices.getMeals().length,
              itemBuilder: (context, index) {
                return MealCard(index: index, width: width, height: height);
              },
            ),
          ),
        ],
      ),
    );
  }
}
