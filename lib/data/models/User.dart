class Users {
  String id;
  String phoneNumber;
  String? defaultAddress;
  bool hadBreakfast;
  bool hadLunch;
  bool hadDinner;
  String? currentOrder;
  List<String>? currentDeliveryOrders = [];
  bool isAvailable;
  bool isVerifiedAsDliverer = true;

  Users({
    required this.id,
    required this.phoneNumber,
    this.defaultAddress,
    this.hadLunch = false,
    this.hadDinner = false,
    this.hadBreakfast = false,
    this.currentOrder,
    this.currentDeliveryOrders,
    this.isAvailable = true,
    this.isVerifiedAsDliverer = true,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      phoneNumber: json['phoneNumber'],
      defaultAddress: json['defaultAddress'],
      hadBreakfast: json['hadBreakfast'],
      hadLunch: json['hadLunch'],
      hadDinner: json['hadDinner'],
      currentOrder: json['currentOrder'],
      currentDeliveryOrders: json['currentDeliveryOrders'],
      isAvailable: json['isAvailable'],
      isVerifiedAsDliverer: json['isVerifiedAsDliverer'],
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
      'isVerifiedAsDliverer': isVerifiedAsDliverer,
    };
  }
}
