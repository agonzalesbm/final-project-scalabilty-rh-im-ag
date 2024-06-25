namespace backend_service.src.models
{
    public interface IRecipesStoreDatabaseSettings
    {
        string RecipesCollectionName { get; set; }
        string ConnectionString { get; set; }
        string DatabaseName { get; set; }
    }
}