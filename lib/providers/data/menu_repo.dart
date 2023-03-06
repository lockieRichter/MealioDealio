import 'package:mealio_dealio/model/weekday.dart';
import 'package:mealio_dealio/providers/data/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'menu_repo.g.dart';

@riverpod
class MenuRepository extends _$MenuRepository {
  @override
  Database build() {
    return ref.read(databaseProvider);
  }

  void updateValue(Weekday weekday, String value) async {
    await state.insert(
      menuTable,
      {'day': weekday.name, 'name': value},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Map<Weekday, String>> get menu async {
    final maps = await state.query(menuTable);
    final menu = {
      for (var map in maps)
        Weekday.values.byName(map["day"] as String): map["name"] as String
    };

    return menu;
  }
}
