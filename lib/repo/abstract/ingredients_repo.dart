abstract class IngredientsRepo {
  const IngredientsRepo();

  Future<void> updateIngredients(String ingredients);

  Future<String> getIngredients();
}
