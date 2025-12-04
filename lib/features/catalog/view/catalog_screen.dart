import 'package:flutter/material.dart';
import '../../../data/dishes.dart';
import '../../../models/dish.dart';
import 'product_details_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Каталог")),
      body: ListView.builder(
        itemCount: dishes.length,
        itemBuilder: (context, index) {
          final Dish dish = dishes[index];

          return ListTile(
            leading: Image.asset(
              dish.image,
              width: 60,
              fit: BoxFit.cover,
            ),
            title: Text(dish.title),
            subtitle: Text(dish.description),
            trailing: Text("${dish.price} ₾"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailsScreen(dish: dish),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
