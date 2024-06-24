CREATE OR REPLACE PROCEDURE insert_tag(
        p_name VARCHAR(20),
        p_description VARCHAR(150)
    ) LANGUAGE plpgsql AS $$ BEGIN
INSERT INTO tags (name, description)
VALUES (p_name, p_description);
COMMIT;
END;
$$;
CREATE OR REPLACE PROCEDURE insert_measurement_units(
        p_measurement_unit_name VARCHAR(50),
        p_measurement_unit_abbreviation VARCHAR(5)
    ) LANGUAGE plpgsql AS $$ BEGIN
INSERT INTO measurement_units (name, abbreviation)
VALUES (
        p_measurement_unit_name,
        p_measurement_unit_abbreviation
    );
COMMIT;
END;
$$;

CREATE OR REPLACE FUNCTION insert_ingredients(
    p_name VARCHAR(50),
    p_calories FLOAT
)
RETURNS INT 
LANGUAGE plpgsql 
AS $$ 
DECLARE 
    v_ingredient_id INT;
BEGIN
    INSERT INTO ingredients (name, calories)
    VALUES (p_name, p_calories)
    RETURNING id_ingredient INTO v_ingredient_id;
    
    RETURN v_ingredient_id;
END;
$$;


CREATE OR REPLACE PROCEDURE insert_rating(
        p_recipe_id INT,
        p_creator VARCHAR(100),
        p_score INT
    ) LANGUAGE plpgsql AS $$ BEGIN
INSERT INTO ratings (id_recipe, id_user, score)
VALUES (p_recipe_id, p_creator, p_score);
COMMIT;
END;
$$;

CREATE OR REPLACE FUNCTION insert_tag_list(
    id_recipe INT,
    name_tag VARCHAR(20),
    details VARCHAR(150) DEFAULT NULL
) RETURNS VOID AS $$
DECLARE
    tag_id INT;
BEGIN
    SELECT id_tag INTO tag_id FROM tags WHERE name = name_tag;
    
    IF tag_id IS NULL THEN
        INSERT INTO tags (name, description) VALUES (name_tag, details) RETURNING id_tag INTO tag_id;
    END IF;
    
    INSERT INTO tag_list (id_tag, id_recipe) VALUES (tag_id, id_recipe);
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE PROCEDURE insert_image_to_list(p_path VARCHAR(300), p_recipe_id INT) LANGUAGE plpgsql AS $$ BEGIN -- Insertar en la tabla "images_list"
INSERT INTO images_list (path, id_recipe)
VALUES (p_path, p_recipe_id);
COMMIT;
END;
$$;
CREATE OR REPLACE PROCEDURE insert_instruction(p_recipe_id INT, p_step VARCHAR(100)) LANGUAGE plpgsql AS $$ BEGIN -- Insertar en la tabla "instructions"
INSERT INTO instructions (id_recipe, step)
VALUES (p_recipe_id, p_step);
COMMIT;
END;
$$;