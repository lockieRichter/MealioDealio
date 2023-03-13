import 'package:mealio_dealio/repo/abstract/ingredients_repo.dart';
import 'package:mealio_dealio/repo/abstract/menu_repo.dart';
import 'package:mealio_dealio/repo/abstract/recipe_repo.dart';
import 'package:mealio_dealio/repo/sql/sql_ingredients_repo.dart';
import 'package:mealio_dealio/repo/sql/sql_menu_repo.dart';
import 'package:mealio_dealio/repo/sql/sql_recipe_repo.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

part 'database.g.dart';

const String menuTable = 'menu';
const String ingredientsTable = 'ingredients';
const String recipesTable = 'recipes';

@riverpod
Database database(DatabaseRef ref) => throw UnimplementedError();

@riverpod
SharedPreferences sharedPreferences(SharedPreferencesRef ref) =>
    throw UnimplementedError();

@riverpod
IngredientsRepo ingredientsRepo(IngredientsRepoRef ref) {
  final database = ref.watch(databaseProvider);

  return SqlIngredientsRepo(database: database);
}

@riverpod
MenuRepo menuRepo(MenuRepoRef ref) {
  final database = ref.watch(databaseProvider);

  return SqlMenuRepo(database: database);
}

@riverpod
RecipeRepo recipeRepo(RecipeRepoRef ref) {
  final database = ref.watch(databaseProvider);

  return SqlRecipeRepo(database: database);
}

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
  day TEXT CHECK(day IN ('sunday','monday','tuesday','wednesday','thursday','friday','saturday')) NOT NULL,
  name TEXT
  );
  ''');
  await db.execute('''
CREATE TABLE $ingredientsTable(
  id INTEGER PRIMARY KEY,
  name TEXT,
  category TEXT CHECK(category IN ('meat','fish','vegetable','fruit','dairy','bakery','grain','spice','other')) NOT NULL
  );
  ''');
  await db.execute('''
CREATE TABLE $recipesTable(
  id INTEGER PRIMARY KEY,
  value TEXT
  );
  ''');
}
