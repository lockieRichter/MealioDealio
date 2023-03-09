abstract class RecipeRepo {
  const RecipeRepo();

  Future<void> addRecipe(String recipe);

  Future<void> deleteRecipe(int recipeID);

  Future<List<String>> getRecipes();
}
