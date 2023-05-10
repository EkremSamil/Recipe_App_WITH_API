import 'package:recipes/data/models/ingredient.dart';
import 'package:recipes/data/models/recipe.dart';

abstract class Repository {
  List<Recipe> findAllRecipes();
  Recipe findRecipeById(int id);
  List<Ingredient> findAllIngredients();
  List<Ingredient> findRecipeIngredients(int recipeId);
  // TODO: Add insert methods
  // TODO: Add delete methods
  // TODO: Add initializing and closing methods
}
