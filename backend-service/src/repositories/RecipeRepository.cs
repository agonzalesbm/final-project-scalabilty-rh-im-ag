using backend_service.src.models;
using MongoDB.Driver;

public class RecipeRepository
{
  private readonly IMongoCollection<Recipe> _recipes;

  public RecipeRepository(IMongoDatabase database)
  {
    _recipes = database.GetCollection<Recipe>("Recipes");
  }

  public async Task<IEnumerable<Recipe>> GetAllRecipes()
  {
    return await _recipes.Find(recipe => true).ToListAsync();
  }

  public async Task<Recipe> GetRecipeById(string id)
  {
    return await _recipes.Find<Recipe>(recipe => recipe.Id == id).FirstOrDefaultAsync();
  }

  public async Task AddRecipe(Recipe recipe)
  {
    await _recipes.InsertOneAsync(recipe);
  }

  public async Task UpdateRecipe(Recipe recipe)
  {
    await _recipes.ReplaceOneAsync(r => r.Id == recipe.Id, recipe);
  }

  public async Task DeleteRecipe(string id)
  {
    await _recipes.DeleteOneAsync(r => r.Id == id);
  }
}
