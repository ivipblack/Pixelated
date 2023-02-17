import 'User.dart';

class DeliveryGuy extends User {
  List<String> currentOrders;

  DeliveryGuy({
    required String id,
    required this.currentOrders,
  }) : super(id: id);
}
