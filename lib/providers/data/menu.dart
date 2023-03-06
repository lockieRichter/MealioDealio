import 'package:mealio_dealio/model/weekday.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

import 'database.dart';

part 'menu.g.dart';

@riverpod
class Menu extends _$Menu {
  @override
  Future<Map<Weekday, String>> build() async {
    final database = ref.read(databaseProvider);

    final maps = await database.query("menu");
    final menu = {
      for (var map in maps)
        Weekday.values.byName(map["day"] as String): map["name"] as String
    };

    return menu;
  }

  void updateValue(Weekday weekday, String value) async {
    state.whenData((data) => data[weekday] = value);

    final database = ref.read(databaseProvider);
    await database.insert(
      'menu',
      {'day': weekday.name, 'name': value},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
