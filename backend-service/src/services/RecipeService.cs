
using backend_service.src.models;
using MongoDB.Driver;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace backend_service.src.services
{
  public class RecipeService : IRecipeService
  {
    private readonly IMongoCollection<Recipe> _recipes;

    public RecipeService(IRecipesStoreDatabaseSettings settings, IMongoClient mongoClient)
    {
      var database = mongoClient.GetDatabase(settings.DatabaseName);
      _recipes = database.GetCollection<Recipe>(settings.RecipesCollectionName);
    }

    public Recipe AddRecipe(Recipe recipe)
    {
      _recipes.InsertOne(recipe);
      return recipe;
    }

    public List<Recipe> GetAllRecipes()
    {
      return _recipes.Find(recipe => true).ToList();
    }
    public Recipe GetRecipeById(string id)
    {
      return _recipes.Find(recipe => recipe.Id == id).FirstOrDefault();
    }

    public void DeleteRecipe(string id)
    {
      _recipes.DeleteOne(recipe => recipe.Id == id);

    }

    public void UpdateRecipe(string id, Recipe recipe)
    {
      _recipes.ReplaceOne(recipe => recipe.Id == id, recipe);
    }
  }
}
