import 'package:pixelated/data/models/Meals%20Models/Grill.dart';

import '../models/Meals Models/Brosted.dart';
import '../models/Meals Models/Chicken.dart';
import '../models/Meals Models/Meal.dart';
import '../models/Meals Models/Meat.dart';
import '../models/Meals Models/Burger.dart';
import '../models/Meals Models/Grill.dart';

class MealsServices {
  static List<Meal> getMeals() {
    return [
      ChickenRice(),
      Meat(),
      Brosted(),
      Burger(),
      Grill(),
    ];
  }

  static String getMealDetails(String meal) {
    switch (meal) {
      case 'Chicken':
        return ChickenRice()
            .included
            .toString()
            .substring(1, ChickenRice().included!.toString().length - 1);
      case 'Meat':
        return Meat()
            .included
            .toString()
            .substring(1, Meat().included!.toString().length - 1);
      case 'Brosted':
        return Brosted()
            .included
            .toString()
            .substring(1, Brosted().included!.toString().length - 1);
      case 'Burger':
        return Burger()
            .included
            .toString()
            .substring(1, Burger().included!.toString().length - 1);
      case 'Grill':
        return Grill()
            .included
            .toString()
            .substring(1, Grill().included!.toString().length - 1);
      default:
    }
    return '';
  }
}

// MealsServices.getMeals()[index]
//                                 .included!
//                                 .toString()
//                                 .substring(
//                                   1,
//                                   MealsServices.getMeals()[index]
//                                           .included!
//                                           .toString()
//                                           .length -
//                                       1,
//                                 ),
