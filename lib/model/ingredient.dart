import 'package:mealio_dealio/model/ingredient_category.dart';

class Ingredient {
  final IngredientCategory category;
  final String name;
  final String amount;

  Ingredient({
    required this.category,
    required this.name,
    required this.amount,
  });
}
