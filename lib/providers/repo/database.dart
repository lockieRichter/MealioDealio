import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'database.g.dart';

const String menuTable = 'menu';
const String ingredientsTable = 'ingredients';
const String recipesTable = 'recipes';

@riverpod
Database database(DatabaseRef ref) => throw UnimplementedError();

Future<Database> getDatabase() async {
  final database = openDatabase(
    join(await getDatabasesPath(), 'database.db'),
    onCreate: (db, version) {
      _createTables(db);
    },
    version: 1,
  );
  return database;
}

void _createTables(Database db) async {
  await db.execute('''
CREATE TABLE $menuTable(
  id INTEGER PRIMARY KEY,
  day TEXT CHECK(day IN ('sunday','monday','tuesday', 'wednesday','thursday','friday','saturday')) NOT NULL,
  name TEXT
  );
  ''');
  await db.execute(
    '''
CREATE TABLE $ingredientsTable(
  id INTEGER PRIMARY KEY,
  value TEXT
  );
  ''',
  );
  await db.execute(
    '''
CREATE TABLE $recipesTable(
  id INTEGER PRIMARY KEY,
  value TEXT
  );
  ''',
  );
}
