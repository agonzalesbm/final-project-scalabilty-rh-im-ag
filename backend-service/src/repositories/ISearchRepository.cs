using backend_service.src.models;

namespace backend_service.src.repositories
{
    public interface ISearchRepository
    {
        Task<IEnumerable<SearchResult>> GetSearchResults(string id, string word, int page, string level, List<string> tags, List<string> ingredients);
    }
}