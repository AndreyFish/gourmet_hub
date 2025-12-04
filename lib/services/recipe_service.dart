import '../repositories/recipe_repository.dart';
import '../models/recipe.dart';

class RecipeService {
  final RecipeRepository _repository;

  RecipeService(this._repository);

  Future<List<Recipe>> getRecipes() async {
    return await _repository.fetchRecipes();
  }

  Future<Recipe?> getRecipeById(String id) async {
    return await _repository.fetchRecipeById(id);
  }

  Future<void> addRecipe(Recipe recipe) async {
    await _repository.createRecipe(recipe);
  }

  Future<void> updateRecipe(Recipe recipe) async {
    await _repository.updateRecipe(recipe);
  }

  Future<void> deleteRecipe(String id) async {
    await _repository.deleteRecipe(id);
  }
}
