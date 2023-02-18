class Orders {
  final String customerId;
  final String phoneNumber;
  String? delivererPhoneNumber;
  String? delivererId;
  final String address;
  final String status;
  final DateTime createdAt;
  String meal;
  final String drink;
  final String salad;
  final String sweet;
  bool? needBread;
  String? prefers;
  final String orderId;

  Orders({
    required this.customerId,
    required this.address,
    required this.status,
    required this.createdAt,
    required this.meal,
    required this.drink,
    required this.salad,
    required this.sweet,
    this.needBread,
    this.delivererId,
    required this.phoneNumber,
    this.delivererPhoneNumber,
    this.prefers,
    required this.orderId,
  });

  factory Orders.fromJson(Map<String, dynamic> json) {
    return Orders(
      customerId: json['customerId'],
      address: json['address'],
      status: json['status'],
      createdAt: json['createdAt'].toDate(),
      meal: json['meal'],
      drink: json['drink'],
      salad: json['salad'],
      sweet: json['sweet'],
      needBread: json['needBread'],
      delivererId: json['delivererId'],
      phoneNumber: json['phoneNumber'],
      delivererPhoneNumber: json['delivererPhoneNumber'],
      prefers: json['prefers'],
      orderId: json['orderId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'address': address,
      'status': status,
      'createdAt': createdAt,
      'meal': meal,
      'drink': drink,
      'salad': salad,
      'sweet': sweet,
      'needBread': needBread,
      'delivererId': delivererId,
      'phoneNumber': phoneNumber,
      'delivererPhoneNumber': delivererPhoneNumber,
      'prefers': prefers,
      'orderId': orderId,
    };
  }
}
