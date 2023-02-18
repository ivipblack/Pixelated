// ignore_for_file: annotate_overrides, overridden_fields
import 'Meal.dart';

class Brosted extends Meal {
  String? name = 'Brosted';
  String? description = 'This is the brosted description';
  String? imageUrl = 'assets/brosted.png';
  List<String>? included = [
    'Brosted',
    'Frech Fries',
    'Salad',
    'Drink',
    'Sweet'
  ];
}
