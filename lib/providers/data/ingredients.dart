import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ingredients.g.dart';

@riverpod
class Ingredients extends _$Ingredients {
  @override
  String build() {
    return "";
  }

  void updateValue(String value) {
    // state.whenData((data) => data = value);
    // ref.read(ingredientsRepoProvider).updateIngredients(value);
  }
}
