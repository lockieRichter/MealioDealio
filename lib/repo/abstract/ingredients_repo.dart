import 'package:mealio_dealio/model/ingredient.dart';

abstract class IngredientsRepo {
  const IngredientsRepo();

  Future<List<Ingredient>> getAllIngredients();
}
