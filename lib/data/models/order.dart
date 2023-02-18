class Orders {
  final String customerId;
  String? delivererId;
  final String address;
  final String status;
  final DateTime createdAt;
  final String meal;
  final String drink;
  final String salad;
  final String sweet;
  final bool needBread;

  Orders({
    required this.customerId,
    required this.address,
    required this.status,
    required this.createdAt,
    required this.meal,
    required this.drink,
    required this.salad,
    required this.sweet,
    required this.needBread,
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
    };
  }
}
