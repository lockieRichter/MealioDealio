import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'menu_repository.g.dart';

@riverpod
class MenuRepository extends _$MenuRepository {
  @override
  Future<Database> build() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'mealio_dealio_database.db'),
      onCreate: (db, version) {
        return db.execute(
          """
CREATE TABLE menu(
  id INTEGER PRIMARY KEY,
  day TEXT CHECK(day IN ('sunday','monday','tuesday', 'wednesday','thursday','friday','saturday')) NOT NULL,
  name TEXT
  )
  """,
        );
      },
      version: 1,
    );
    return database;
  }
}
