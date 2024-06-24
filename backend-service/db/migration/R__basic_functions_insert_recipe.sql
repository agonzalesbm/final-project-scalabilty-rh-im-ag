CREATE OR REPLACE FUNCTION minutes_to_hh_mm(minutos INT) RETURNS VARCHAR(5) AS $$
DECLARE horas INT;
minutos_residuales INT;
BEGIN horas := minutos / 60;
minutos_residuales := minutos % 60;
RETURN CONCAT(
    LPAD(horas::TEXT, 2, '0'),
    ':',
    LPAD(minutos_residuales::TEXT, 2, '0')
);
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION make_minutes(hora INT, minutos INT) RETURNS INT AS $$
DECLARE total_minutos INT;
BEGIN total_minutos := (hora * 60) + minutos;
RETURN total_minutos;
END;
$$ LANGUAGE plpgsql;



-- insert recipes return id_recipe
CREATE OR REPLACE FUNCTION insert_recipe(
        p_recipe_name VARCHAR(100),
        p_preparation_hr INT,
        p_preparation_mn INT,
        p_cooking_hr INT,
        p_cooking_mn INT,
        p_portions INT,
        p_difficulty_id INT,
        p_permission_id INT,
        p_creator_id VARCHAR(100),
        p_name_creator VARCHAR(100)
    ) RETURNS INT LANGUAGE plpgsql AS $$
DECLARE v_recipe_id INT;
v_min_cooking INT;
v_min_preparation INT;
BEGIN 
v_min_preparation := make_minutes(p_preparation_hr, p_preparation_mn);
v_min_cooking := make_minutes(p_cooking_hr, p_cooking_mn);
INSERT INTO recipes (
        name,
        preparation_time,
        cooking_time,
        portions,
        id_difficulty,
        id_permission,
        id_creator,
        name_creator
    )
VALUES (
        p_recipe_name,
        v_min_preparation,
        v_min_cooking,
        p_portions,
        p_difficulty_id,
        p_permission_id,
        p_creator_id,
        p_name_creator
    )
RETURNING id_recipe INTO v_recipe_id;
RETURN v_recipe_id;
END;
$$;