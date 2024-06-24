CREATE TABLE IF NOT EXISTS recipes_user(
    id_recipe_user SERIAL PRIMARY KEY,
    id_user VARCHAR NOT NULL,
    id_recipe INT NOT NULL,
    FOREIGN KEY (id_recipe) REFERENCES recipes(id_recipe)
);