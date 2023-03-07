abstract class IngredientsRepo {
  Future<void> updateIngredients(String ingredients);

  Future<String> getIngredients();
}
