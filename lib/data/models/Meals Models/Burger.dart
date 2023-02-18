// ignore_for_file: annotate_overrides, overridden_fields

import 'Meal.dart';

class Burger extends Meal {
  String? name = 'Burger Meal';
  String? description = 'This is the Burger Meal description';
  String? imageUrl = 'assets/burger.png';
  List<String>? included = [
    'Burger',
    'French Fries',
    'Salad',
    'Drink',
    'Sweet'
  ];
}
