using backend_service.src.models;
using backend_service.src.repositories;

namespace backend_service.src.services
{
    public class SearchService : ISearchService
    {
        private readonly ISearchRepository _searchRepository;

        public SearchService(ISearchRepository searchRepository)
        {
            _searchRepository = searchRepository;
        }

        public async Task<IEnumerable<SearchResult>> SearchByUser(string id, string word, int page, string level, List<string> tags, List<string> ingredients)
        {
            return await _searchRepository.GetSearchResults(id, word, page, level, tags, ingredients);
        }
    }
}