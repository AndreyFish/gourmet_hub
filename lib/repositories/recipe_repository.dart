import '../models/recipe.dart';

class RecipeRepository {
  Future<List<Recipe>> fetchRecipes() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      Recipe(
        id: '1',
        title: 'Khachapuri',
        description: 'Traditional Georgian cheese bread.',
      ),
      Recipe(
        id: '2',
        title: 'Ostri',
        description: 'Spicy Georgian beef stew.',
      ),
    ];
  }

  Future<Recipe?> fetchRecipeById(String id) async {
    final items = await fetchRecipes();
    return items.firstWhere((e) => e.id == id);
  }

  Future<void> createRecipe(Recipe recipe) async {}
  Future<void> updateRecipe(Recipe recipe) async {}
  Future<void> deleteRecipe(String id) async {}
}
