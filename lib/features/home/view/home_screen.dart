import 'package:flutter/material.dart';
import '../../../data/dishes.dart';
import '../../../models/dish.dart';
import '../../catalog/view/product_details_screen.dart';
import 'package:gourmet_hub/models/recipe.dart';

class HomeScreen extends StatelessWidget {
  final List<Recipe> recipes; // ← добавили

  const HomeScreen({super.key, required this.recipes});
  
  @override
  Widget build(BuildContext context) {
    final Dish dishOfTheDay = dishes.first;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F4FB),

      appBar: AppBar(
        backgroundColor: const Color(0xFF8E44AD),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Главная",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ------------------------------
          //   БЛЮДО ДНЯ
          // ------------------------------
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailsScreen(dish: dishOfTheDay),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                dishOfTheDay.image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // ---------------------------------------
          //   РЕКОМЕНДАЦИИ (БЛЮДА)
          // ---------------------------------------
          const Text(
            "Рекомендации",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color(0xFF6C2E91),
            ),
          ),

          const SizedBox(height: 14),

          ...dishes.map((dish) {
            return Container(
              margin: const EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    dish.image,
                    width: 62,
                    height: 62,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  dish.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xFF3A1F47),
                  ),
                ),
                subtitle: Text(
                  dish.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF7B6F89),
                  ),
                ),
                trailing: Text(
                  "${dish.price} ₾",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF8E44AD),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailsScreen(dish: dish),
                    ),
                  );
                },
              ),
            );
          }).toList(),

          const SizedBox(height: 30),

          // ---------------------------------------
          //   РЕЦЕПТЫ — новый блок
          // ---------------------------------------
          if (recipes.isNotEmpty) ...[
            const Text(
              "Рецепты",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xFF6C2E91),
              ),
            ),

            const SizedBox(height: 14),

            ...recipes.map((r) {
              return Container(
                margin: const EdgeInsets.only(bottom: 14),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      r.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF3A1F47),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      r.description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF7B6F89),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ]
        ],
      ),
    );
  }
}
