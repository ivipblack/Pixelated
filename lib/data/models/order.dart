class Order {
  final String customerId;
  final String address;
  final String paymentId;
  final String status;
  final String createdAt;
  final List<dynamic> items;

  Order({
    required this.customerId,
    required this.address,
    required this.paymentId,
    required this.status,
    required this.createdAt,
    required this.items,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      customerId: json['customerId'],
      address: json['address'],
      paymentId: json['paymentId'],
      status: json['status'],
      createdAt: json['createdAt'],
      items: json['items'],
    );
  }
}
