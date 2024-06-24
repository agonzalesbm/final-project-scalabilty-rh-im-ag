using backend_service.src.services;
using Microsoft.AspNetCore.Mvc;

namespace backend_service.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SearchController : ControllerBase
    {
        private readonly ISearchService _searchService;

        public SearchController(ISearchService searchService)
        {
            _searchService = searchService;
        }

        [HttpGet]
        public async Task<IActionResult> Get([FromQuery] string id = "0", [FromQuery] string word = "", [FromQuery] int p = 0, [FromQuery] string level = "All", [FromQuery] string tags = "", [FromQuery] string ingredients = "")
        {
            if (string.IsNullOrEmpty(word))
            {
                return BadRequest("Introduce a valid Word");
            }

            var tagList = tags.Split(',').ToList();
            var ingredientList = ingredients.Split(',').ToList();

            var result = await _searchService.SearchByUser(id, word, p, level, tagList, ingredientList);
            return Ok(result);
        }
    }
}
