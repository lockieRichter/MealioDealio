import 'package:mealio_dealio/model/weekday.dart';
import 'package:mealio_dealio/providers/data/database.dart';
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
    final rows = await _database.query(menuTable);
    final menu = {
      for (var row in rows)
        Weekday.values.byName(row["day"] as String): row["name"] as String
    };

    return menu;
  }
}
