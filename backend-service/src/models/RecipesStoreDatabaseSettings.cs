namespace backend_service.src.models
{
    public class RecipesStoreDatabaseSettings : IRecipesStoreDatabaseSettings
    {
        public string RecipesCollectionName { get; set; } = string.Empty;
        public string ConnectionString { get; set; } = string.Empty;
        public string DatabaseName { get; set; } = string.Empty;
    }
}