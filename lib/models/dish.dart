class Dish {
  final String id;
  final String title;
  final String description;
  final double price;
  final String image;

  Dish({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Dish && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}