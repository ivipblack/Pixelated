class User {
  String id;
  String phoneNumber;
  String defaultAddress;
  bool hadBreakfast;
  bool hadLunch;
  bool hadDinner;
  String currentOrder;
  List<String> currentDeliveryOrders = [];
  bool isAvailable;
  bool isVerifiedAsDliverer = true;

  User({
    required this.id,
    required this.phoneNumber,
    required this.defaultAddress,
    this.hadLunch = false,
    this.hadDinner = false,
    this.hadBreakfast = false,
    required this.currentOrder,
    required this.currentDeliveryOrders,
    this.isAvailable = true,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      phoneNumber: json['phoneNumber'],
      defaultAddress: json['defaultAddress'],
      hadBreakfast: json['hadBreakfast'],
      hadLunch: json['hadLunch'],
      hadDinner: json['hadDinner'],
      currentOrder: json['currentOrder'],
      currentDeliveryOrders: json['currentDeliveryOrders'].cast<String>(),
      isAvailable: json['isAvailable'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'defaultAddress': defaultAddress,
      'hadBreakfast': hadBreakfast,
      'hadLunch': hadLunch,
      'hadDinner': hadDinner,
      'currentOrder': currentOrder,
      'currentDeliveryOrders': currentDeliveryOrders,
      'isAvailable': isAvailable,
    };
  }
}
