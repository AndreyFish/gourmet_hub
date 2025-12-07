import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gourmet_hub/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
        backgroundColor: const Color(0xFFFF9800),
      ),
      body: cart.items.isEmpty
          ? const Center(
              child: Text(
                'Корзина пуста 😔\nДобавьте вкусняшки!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return Card(
                        margin: const EdgeInsets.all(8),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(item.dish.image, width: 80, height: 80, fit: BoxFit.cover),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.dish.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                    Text('${item.dish.price} ₽ × ${item.quantity} = ${item.totalPrice} ₽'),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(onPressed: () => cart.removeItem(item.dish), icon: const Icon(Icons.remove_circle_outline)),
                                  Text('${item.quantity}', style: const TextStyle(fontSize: 18)),
                                  IconButton(onPressed: () => cart.addItem(item.dish), icon: const Icon(Icons.add_circle_outline)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.grey[100],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Итого: ${cart.totalPrice.toStringAsFixed(0)} ₽', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF9800), padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Заказ оформлен! 🎉 Курьер уже летит с борщом!')));
                          cart.clear();
                        },
                        child: const Text('Оформить заказ', style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}