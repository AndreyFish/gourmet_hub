import 'package:gourmet_hub/models/dish.dart';

class CartItem {
  final Dish dish;
  int quantity;

  CartItem({required this.dish, this.quantity = 1});

  double get totalPrice => dish.price * quantity;

  CartItem copyWith({int? quantity}) {
    return CartItem(
      dish: dish,
      quantity: quantity ?? this.quantity,
    );
  }
}