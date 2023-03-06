import 'package:mealio_dealio/providers/data/ingredients_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ingredients.g.dart';

@riverpod
class Ingredients extends _$Ingredients {
  @override
  Future<String> build() {
    return ref.read(ingredientsRepositoryProvider.notifier).ingredients;
  }

  void updateValue(String value) {
    state.whenData((data) => data = value);
    ref.read(ingredientsRepositoryProvider.notifier).updateValue(value);
  }
}
