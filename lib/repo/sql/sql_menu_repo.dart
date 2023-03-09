import 'package:mealio_dealio/model/weekday.dart';
import 'package:mealio_dealio/providers/repo/database.dart';
import 'package:mealio_dealio/repo/abstract/menu_repo.dart';
import 'package:sqflite/sqflite.dart';

class SqlMenuRepo extends MenuRepo {
  final Database _database;

  const SqlMenuRepo({
    required Database database,
  }) : _database = database;

  @override
  Future<void> updateMenuItem(Weekday day, String recipe) async {
    await _database.insert(
      menuTable,
      {'day': day.name, 'name': recipe},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<Map<Weekday, String>> getMenu() async {
    final maps = await _database.query(menuTable);
    final menu = {
      for (var map in maps)
        Weekday.values.byName(map["day"] as String): map["name"] as String
    };

    return menu;
  }
}
