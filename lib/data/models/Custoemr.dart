class Customer {
  String id;
  String defaultAddress;
  bool hadBreakfast;
  bool hadLunch;
  bool hadDinner;
  String currentOrders;
  List<String> currentDeliveryOrders = [];
  bool isAvailable;
  bool isVerifiedAsDliverer = true;

  Customer({
    required this.id,
    required this.defaultAddress,
    required this.hadLunch,
    required this.hadDinner,
    required this.hadBreakfast,
    required this.currentOrders,
    required this.currentDeliveryOrders,
    required this.isAvailable,
  });
}
