import 'package:flutter/material.dart';
import 'package:gourmet_hub/models/dish.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Dish dish;

  const ProductDetailsScreen({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dish.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                dish.image, // <— ВАЖНО: исправлено
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              dish.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              dish.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              "${dish.price.toStringAsFixed(2)} ₾",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
