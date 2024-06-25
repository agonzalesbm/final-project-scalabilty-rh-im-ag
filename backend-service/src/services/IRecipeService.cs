using backend_service.src.models;

namespace backend_service.src.services
{
  public interface IRecipeService
  {
    List<Recipe> GetAllRecipes();
    Recipe GetRecipeById(string id);
    Recipe AddRecipe(Recipe recipe);
    void UpdateRecipe(string id, Recipe recipe);
    void DeleteRecipe(string id);
  }
}
