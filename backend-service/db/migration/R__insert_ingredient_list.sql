CREATE OR REPLACE FUNCTION insert_list_ingredient(
    id_recipe INT,
    quantity FLOAT,
    name_ingredient VARCHAR(50),
    measurement_name VARCHAR(50),
    details VARCHAR(100) DEFAULT NULL
) RETURNS VOID AS $$
DECLARE
    ingredient_id INT;
    measurement_id INT;
BEGIN
    SELECT id_ingredient INTO ingredient_id FROM ingredients WHERE LOWER(name) = LOWER(name_ingredient);
    IF ingredient_id IS NULL THEN
        INSERT INTO ingredients (name, calories) VALUES (name_ingredient, NULL) RETURNING id_ingredient INTO ingredient_id;
    END IF;
    SELECT id_measurement_unit INTO measurement_id FROM measurement_units WHERE name = measurement_name;
    
    IF measurement_id IS NULL THEN
        INSERT INTO measurement_units (name, abbreviation) VALUES (measurement_name, 'avg') RETURNING id_measurement_unit INTO measurement_id;
    END IF;
    INSERT INTO list_ingredients (quantity, id_recipe, id_ingredient, id_measurement_unit, details)
    VALUES (quantity, id_recipe, ingredient_id, measurement_id, details);
END;
$$ LANGUAGE plpgsql;