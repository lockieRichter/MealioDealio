import 'package:mealio_dealio/providers/repo/ingredients_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ingredients.g.dart';

@riverpod
class Ingredients extends _$Ingredients {
  @override
  Future<String> build() {
    return ref.read(ingredientsRepoProvider).getIngredients();
  }

  void updateValue(String value) {
    state.whenData((data) => data = value);
    ref.read(ingredientsRepoProvider).updateIngredients(value);
  }
}
