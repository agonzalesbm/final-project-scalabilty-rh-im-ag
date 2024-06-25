using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace backend_service.src.models
{

    public class Recipe
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string? Id { get; set; }  // Asegúrate de que 'id_recipe' es de tipo entero en la base de datos.
        [BsonElement("name")]
        public string Name { get; set; }
        [BsonElement("preparationTime")]
        public int PreparationTime { get; set; }
        [BsonElement("cookingTime")]
        public int CookingTime { get; set; }
        [BsonElement("portions")]
        public int Portions { get; set; }
        [BsonElement("difficultyId")]
        public int DifficultyId { get; set; }
        [BsonElement("ingredientes")]
        public string[]? ingredientes { get; set; }
        [BsonElement("steps")]
        public string[]? Steps { get; set; }
        [BsonElement("creatorId")]
        public int CreatorId { get; set; }
        [BsonElement("creatorName")]
        public string CreatorName { get; set; }
        [BsonElement("dateCreation")]
        public DateTime DateCreation { get; set; }
    }
}