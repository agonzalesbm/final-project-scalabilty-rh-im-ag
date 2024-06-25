using backend_service.src.services;
using Microsoft.EntityFrameworkCore;
using backend_service.src.models;
using Microsoft.Extensions.Options;
using MongoDB.Driver;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.Configure<RecipesStoreDatabaseSettings>(
    builder.Configuration.GetSection(nameof(RecipesStoreDatabaseSettings)));
builder.Services.AddSingleton<IRecipesStoreDatabaseSettings>(sp =>
sp.GetRequiredService<IOptions<RecipesStoreDatabaseSettings>>().Value);
builder.Services.AddSingleton<IMongoClient>(s => new MongoClient(builder.Configuration.GetValue<string>("RecipesStoreDatabaseSettings:ConnectionString")));

builder.Services.AddScoped<IRecipeService, RecipeService>();
builder.Services.AddControllers();

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseAuthorization();

app.MapControllers();

app.Run();

public partial class Program { }
