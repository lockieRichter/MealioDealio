import 'package:mealio_dealio/providers/data/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'ingredients.g.dart';

@riverpod
class Ingredients extends _$Ingredients {
  @override
  Future<String> build() async {
    final database = ref.read(databaseProvider);

    final maps = await database.query("ingredients");

    if (maps.isNotEmpty) {
      final res = maps.last["value"];
      if (res != null) {
        return res as String;
      }
    }
    return "";
  }

  void updateValue(String value) async {
    state.whenData((data) => data = value);

    final database = ref.read(databaseProvider);
    await database.insert(
      'ingredients',
      {
        // For now we only want to store one row of data.
        'id': '1',
        'value': value,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
