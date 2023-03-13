import 'package:mealio_dealio/model/ingredient.dart';
import 'package:mealio_dealio/providers/data/database.dart';
import 'package:mealio_dealio/repo/abstract/ingredients_repo.dart';
import 'package:sqflite/sqflite.dart';

class SqlIngredientsRepo extends IngredientsRepo {
  final Database _database;

  const SqlIngredientsRepo({
    required Database database,
  }) : _database = database;

  @override
  Future<List<Ingredient>> getAllIngredients() async {
    final ingredients = await _database.query(ingredientsTable);

    if (ingredients.isEmpty) {
      return [];
    }

    return ingredients
        .map((ingredient) => Ingredient.fromJson(ingredient))
        .toList();
  }
}
