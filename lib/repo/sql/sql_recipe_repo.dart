import 'package:mealio_dealio/repo/abstract/recipe_repo.dart';
import 'package:sqflite/sqflite.dart';

class SqlRecipeRepo extends RecipeRepo {
  final Database _database;

  const SqlRecipeRepo({required Database database}) : _database = database;

  @override
  Future<void> addRecipe(String recipe) {
    // TODO: implement addRecipe
    throw UnimplementedError();
  }

  @override
  Future<void> deleteRecipe(String recipe) {
    // TODO: implement deleteRecipe
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getRecipes() {
    // TODO: implement getRecipes
    throw UnimplementedError();
  }
}
