import 'package:mealio_dealio/providers/repo/database.dart';
import 'package:mealio_dealio/repo/abstract/ingredients_repo.dart';
import 'package:sqflite/sqflite.dart';

class SqlIngredientsRepo extends IngredientsRepo {
  final Database _database;

  const SqlIngredientsRepo({
    required Database database,
  }) : _database = database;

  @override
  Future<void> updateIngredients(String ingredients) async {
    await _database.insert(
      ingredientsTable,
      {
        // For now we only want to store one row of data.
        'id': '1',
        'value': ingredients,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<String> getIngredients() async {
    final maps = await _database
        .query(ingredientsTable, where: "id = ?", whereArgs: ["1"]);

    if (maps.isNotEmpty) {
      final res = maps.last["value"];
      if (res != null) {
        return res as String;
      }
    }
    return "";
  }
}
