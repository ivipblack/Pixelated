import 'package:pixelated/data/models/order_card_module.dart';

class OrderVM {
  //make a list of order card model
  static List<OrderCardModel> beverageList = [
    OrderCardModel(
      label: 'Juice',
      iconPath: 'assets/juice.svg',
    ),
    OrderCardModel(
      label: 'Water',
      iconPath: 'assets/water.svg',
    ),
    OrderCardModel(
      label: 'Laban',
      iconPath: 'assets/laban.svg',
    ),
    OrderCardModel(
      label: 'Milk',
      iconPath: 'assets/milk.svg',
    ),
  ];
  static List<OrderCardModel> sidesList = [
    OrderCardModel(
      label: 'Salad',
      iconPath: 'assets/salad.svg',
    ),
    OrderCardModel(
      label: 'Hommus',
      iconPath: 'assets/hummus.svg',
    ),
    OrderCardModel(
      label: 'Tabbulah',
      iconPath: 'assets/tabbulah.svg',
    ),
  ];
  static List<OrderCardModel> sweetList = [
    OrderCardModel(
      label: 'Cake',
      iconPath: 'assets/cake.svg',
    ),
    OrderCardModel(
      label: 'Fruit',
      iconPath: 'assets/apple.svg',
    ),
    OrderCardModel(
      label: 'Yogurt',
      iconPath: 'assets/yoghurt2.svg',
    ),
  ];
}
