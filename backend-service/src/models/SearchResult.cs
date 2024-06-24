namespace backend_service.src.models
{
    public class SearchResult
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Level { get; set; }
        public List<string> Tags { get; set; }
        public List<string> Ingredients { get; set; }
    }
}