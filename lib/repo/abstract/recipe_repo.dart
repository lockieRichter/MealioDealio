abstract class RecipeRepo {
  const RecipeRepo();

  Future<void> addRecipe(String recipe);

  Future<void> deleteRecipe(String recipe);

  Future<List<String>> getRecipes();
}
