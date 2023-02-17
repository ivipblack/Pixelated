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
}
