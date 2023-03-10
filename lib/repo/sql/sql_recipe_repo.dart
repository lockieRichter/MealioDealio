import 'package:mealio_dealio/providers/repo/database.dart';
import 'package:mealio_dealio/repo/abstract/recipe_repo.dart';
import 'package:sqflite/sqflite.dart';

class SqlRecipeRepo extends RecipeRepo {
  final Database _database;

  const SqlRecipeRepo({required Database database}) : _database = database;

  @override
  Future<void> addRecipe(String recipe) async {
    await _database.insert(
      recipesTable,
      {'value': recipe},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> deleteRecipe(int recipeID) async {
    await _database.delete(
      recipesTable,
      where: 'id = ?',
      whereArgs: [recipeID],
    );
  }

  @override
  Future<List<String>> getRecipes() async {
    final rows = await _database.query(recipesTable);

    final recipes = rows.map((row) => row['value'] as String).toList();

    return recipes;
  }
}
