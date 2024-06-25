using backend_service.src.models;
using backend_service.src.services;
using Microsoft.AspNetCore.Mvc;

namespace backend_service.Controllers
{
  [Route("api/[controller]")]
  [ApiController]
  public class RecipesController : ControllerBase
  {
    private readonly IRecipeService recipeService;

    public RecipesController(IRecipeService recipeService)
    {
      this.recipeService = recipeService;
    }

    [HttpGet]
    public ActionResult<List<Recipe>> GetAll()
    {
      return recipeService.GetAllRecipes();
    }

    [HttpGet("{id}")]
    public ActionResult<Recipe> GetById(string id)
    {
      var recipe = recipeService.GetRecipeById(id);
      if (recipe == null)
      {
        return NotFound($"recipe with Id = {id} not found");
      }
      return recipe;
    }

    [HttpPost]
    public ActionResult<Recipe> AddRecipe([FromBody] Recipe recipe)
    {
      if (recipe == null)
      {
        return BadRequest();
      }
      recipeService.AddRecipe(recipe);
      return CreatedAtAction(nameof(GetById), new { id = recipe.Id }, recipe);
    }

    [HttpPut("{id}")]
    public ActionResult UpdateRecipe(string id, [FromBody] Recipe recipe)
    {
      var existingRecipe = recipeService.GetRecipeById(id);
      if (recipe == null || recipe.Id != id)
      {
        return BadRequest();
      }

      if (existingRecipe == null)
      {
        return NotFound($"recipe with Id = {id} not found");
      }
      recipeService.UpdateRecipe(id, recipe);
      return NoContent();
    }

    [HttpDelete("{id}")]
    public ActionResult Delete(string id)
    {
      var existingRecipe = recipeService.GetRecipeById(id);
      if (existingRecipe == null)
      {
        return NotFound($"recipe with Id = {id} not found");
      }

      recipeService.DeleteRecipe(existingRecipe.Id);
      return Ok($"Recipe with Id = {id} deleted");
    }
  }
}
