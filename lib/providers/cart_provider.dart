import 'package:flutter/material.dart';
import 'package:gourmet_hub/models/cart_item.dart';
import 'package:gourmet_hub/models/dish.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get totalItems => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.totalPrice);

  void addItem(Dish dish) {
    final existingIndex = _items.indexWhere((item) => item.dish.id == dish.id);
    if (existingIndex >= 0) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(CartItem(dish: dish));
    }
    notifyListeners();
  }

  void removeItem(Dish dish) {
    final existingIndex = _items.indexWhere((item) => item.dish.id == dish.id);
    if (existingIndex >= 0) {
      if (_items[existingIndex].quantity > 1) {
        _items[existingIndex].quantity--;
      } else {
        _items.removeAt(existingIndex);
      }
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}