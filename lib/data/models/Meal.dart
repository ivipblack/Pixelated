class Meal {
  String name;
  String description;
  String imageUrl;
  List<String> categories;
  List<String> included;
  double price = 4.6;

  Meal({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.categories,
    required this.included,
    required this.price,
  });
}
