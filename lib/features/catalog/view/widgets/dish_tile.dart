import 'package:flutter/material.dart';
import 'package:gourmet_hub/models/dish.dart';

class DishTile extends StatelessWidget {
  final Dish dish;
  final VoidCallback onTap;

  const DishTile({
    super.key,
    required this.dish,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          dish.image,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(dish.title),
      subtitle: Text(
        dish.description,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        '${dish.price.toStringAsFixed(2)} ₾',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
