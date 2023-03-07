import 'package:mealio_dealio/providers/repo/database.dart';
import 'package:mealio_dealio/repo/abstract/ingredients_repo.dart';
import 'package:mealio_dealio/repo/sql/sql_ingredients_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ingredients_repo.g.dart';

@riverpod
IngredientsRepo ingredientsRepo(IngredientsRepoRef ref) {
  final database = ref.watch(databaseProvider);

  return SqlIngredientsRepo(database: database);
}
