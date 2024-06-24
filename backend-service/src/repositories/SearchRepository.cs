using backend_service.src.data;
using backend_service.src.models;
using Microsoft.EntityFrameworkCore;

namespace backend_service.src.repositories
{
    public class SearchRepository : ISearchRepository
    {
        private readonly ApplicationDbContext _context;

        public SearchRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<SearchResult>> GetSearchResults(string id, string word, int page, string level, List<string> tags, List<string> ingredients)
        {
            var query = _context.SearchResults.AsQueryable();

            if (!string.IsNullOrEmpty(word))
            {
                query = query.Where(sr => sr.Name.Contains(word));
            }

            if (level != "All")
            {
                query = query.Where(sr => sr.Level == level);
            }

            if (tags.Any())
            {
                query = query.Where(sr => sr.Tags.Any(tag => tags.Contains(tag)));
            }

            if (ingredients.Any())
            {
                query = query.Where(sr => sr.Ingredients.Any(ingredient => ingredients.Contains(ingredient)));
            }

            return await query.Skip(page * 10).Take(10).ToListAsync();
        }
    }
}
