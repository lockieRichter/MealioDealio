import 'package:mealio_dealio/providers/menu_repository.dart';
import 'package:mealio_dealio/providers/weekday.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'menu.g.dart';

@riverpod
class Menu extends _$Menu {
  @override
  Future<Map<Weekday, String>> build() async {
    final database = await ref.read(menuRepositoryProvider.future);

    final maps = await database.query("menu");
    final menu = {
      for (var map in maps)
        Weekday.values.byName(map["day"] as String): map["name"] as String
    };

    return menu;
  }

  void updateValue(Weekday weekday, String value) async {
    state.whenData((data) => data[weekday] = value);

    final database = await ref.read(menuRepositoryProvider.future);
    await database.insert(
      'menu',
      {'day': weekday.name, 'name': value},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
