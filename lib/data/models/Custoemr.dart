import 'User.dart';

class Customer extends User {
  String defaultAddress;
  bool hadBreakfast;
  bool hadLunch;
  bool hadDinner;

  Customer({
    required String id,
    required this.defaultAddress,
    required this.hadLunch,
    required this.hadDinner,
    required this.hadBreakfast,
  }) : super(id: id);
}
