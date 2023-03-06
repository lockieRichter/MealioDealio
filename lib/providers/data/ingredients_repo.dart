import 'package:mealio_dealio/providers/data/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'ingredients_repo.g.dart';

@riverpod
class IngredientsRepository extends _$IngredientsRepository {
  @override
  Database build() {
    return ref.read(databaseProvider);
  }

  void updateValue(String value) async {
    await state.insert(
      ingredientsTable,
      {
        // For now we only want to store one row of data.
        'id': '1',
        'value': value,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<String> get ingredients async {
    final maps =
        await state.query(ingredientsTable, where: "id = ?", whereArgs: ["1"]);

    if (maps.isNotEmpty) {
      final res = maps.last["value"];
      if (res != null) {
        return res as String;
      }
    }
    return "";
  }
}
