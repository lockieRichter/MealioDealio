import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'database.g.dart';

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
CREATE TABLE menu(
  id INTEGER PRIMARY KEY,
  day TEXT CHECK(day IN ('sunday','monday','tuesday', 'wednesday','thursday','friday','saturday')) NOT NULL,
  name TEXT
  );
  ''');
  await db.execute(
    '''
CREATE TABLE ingredients(
  id INTEGER PRIMARY KEY,
  value TEXT
  );
  ''',
  );
}
