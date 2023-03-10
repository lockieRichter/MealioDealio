import 'package:mealio_dealio/providers/repo/recipes_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe.g.dart';

@riverpod
class Recipe extends _$Recipe {
  @override
  Future<List<String>> build() {
    return ref.read(recipeRepoProvider).getRecipes();
  }

  void addRecipe(String value) {
    state.whenData((data) => data.add(value));
    ref.read(recipeRepoProvider).addRecipe(value);
  }
}
