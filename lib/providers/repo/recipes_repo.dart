import 'package:mealio_dealio/providers/repo/database.dart';
import 'package:mealio_dealio/repo/abstract/recipe_repo.dart';
import 'package:mealio_dealio/repo/sql/sql_recipe_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipes_repo.g.dart';

@riverpod
RecipeRepo recipeRepo(RecipeRepoRef ref) {
  final database = ref.watch(databaseProvider);

  return SqlRecipeRepo(database: database);
}
