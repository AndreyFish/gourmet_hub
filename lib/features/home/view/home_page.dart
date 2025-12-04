import 'package:flutter/material.dart';
import 'package:gourmet_hub/services/recipe_service.dart';
import 'package:gourmet_hub/repositories/recipe_repository.dart';
import 'home_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final recipeService = RecipeService(RecipeRepository());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: recipeService.getRecipes(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final items = snapshot.data!;

        return HomeScreen(recipes: items);
      },
    );
  }
}
