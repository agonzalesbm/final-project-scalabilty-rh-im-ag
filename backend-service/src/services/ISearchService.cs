using backend_service.src.models;

namespace backend_service.src.services
{
    public interface ISearchService
    {
        Task<IEnumerable<SearchResult>> SearchByUser(string id, string word, int page, string level, List<string> tags, List<string> ingredients);
    }
}