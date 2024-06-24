
CREATE TABLE IF NOT EXISTS permissions (
    id_permission SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS tags (
    id_tag SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    description VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS difficulties (
    id_difficulty SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    description VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS ingredients (
    id_ingredient SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    calories FLOAT
);

CREATE TABLE IF NOT EXISTS measurement_units (
    id_measurement_unit SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    abbreviation VARCHAR(5) NOT NULL
);

CREATE TABLE IF NOT EXISTS recipes (
    id_recipe SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    preparation_time INT NOT NULL,
    cooking_time INT NOT NULL,
    portions INT NOT NULL,
    id_difficulty INT NOT NULL,
    id_permission INT NOT NULL DEFAULT 1,
    id_creator VARCHAR(100) NOT NULL,
    name_creator VARCHAR(100),
    date_creation TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_difficulty) REFERENCES difficulties(id_difficulty),
    FOREIGN KEY (id_permission) REFERENCES permissions(id_permission)
);

CREATE TABLE IF NOT EXISTS instructions (
    id_instruction SERIAL PRIMARY KEY,
    id_recipe INT NOT NULL,
    step VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_recipe) REFERENCES recipes(id_recipe)
);

CREATE TABLE IF NOT EXISTS ratings (
    id_rating SERIAL PRIMARY KEY,
    id_recipe INT NOT NULL,
    id_user VARCHAR(100) NOT NULL,
    score INT NOT NULL DEFAULT 1,
    FOREIGN KEY (id_recipe) REFERENCES recipes(id_recipe)
);

CREATE TABLE IF NOT EXISTS tag_list (
    id_tag_list SERIAL PRIMARY KEY,
    id_tag INT NOT NULL,
    id_recipe INT NOT NULL,
    FOREIGN KEY (id_tag) REFERENCES tags(id_tag),
    FOREIGN KEY (id_recipe) REFERENCES recipes(id_recipe)
);

CREATE TABLE IF NOT EXISTS images_list (
    id_images_list SERIAL PRIMARY KEY,
    path VARCHAR(300) NOT NULL,
    id_recipe INT NOT NULL,
    FOREIGN KEY (id_recipe) REFERENCES recipes(id_recipe)
);

CREATE TABLE IF NOT EXISTS list_ingredients (
    id_list_ingredient SERIAL PRIMARY KEY,
    quantity FLOAT DEFAULT 1,
    id_recipe INT NOT NULL,
    id_ingredient INT NOT NULL,
    id_measurement_unit INT NOT NULL,
    details VARCHAR(100),
    FOREIGN KEY (id_recipe) REFERENCES recipes(id_recipe),
    FOREIGN KEY (id_ingredient) REFERENCES ingredients(id_ingredient),
    FOREIGN KEY (id_measurement_unit) REFERENCES measurement_units(id_measurement_unit)
);