import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mealio_dealio/model/ingredient_category.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

@freezed
class Ingredient with _$Ingredient {
  const factory Ingredient({
    required IngredientCategory category,
    required String name,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, Object?> json) =>
      _$IngredientFromJson(json);
}
