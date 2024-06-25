using backend_service.src.models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_service.src.repositories
{
  public interface IRecipeRepository
  {
    Task<IEnumerable<Recipe>> GetAllRecipes();
    Task<Recipe> GetRecipeById(string id);
    Task AddRecipe(Recipe recipe);
    Task UpdateRecipe(string id, Recipe recipe);
    Task DeleteRecipe(string id);
  }
}
