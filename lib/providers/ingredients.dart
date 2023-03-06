import 'package:mealio_dealio/providers/database.dart';
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
      {'value': value},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
