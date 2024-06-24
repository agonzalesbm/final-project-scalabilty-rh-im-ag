CREATE VIEW private_recipes_search AS
WITH cover_image AS (
    SELECT  r.id_recipe, img.path AS path,
            ROW_NUMBER() OVER (PARTITION BY r.id_recipe) AS img_rank
    FROM recipes r
    JOIN images_list img ON r.id_recipe = img.id_recipe
)
SELECT  r.id_creator, r.id_recipe AS id, r.name, d.name AS difficulty,
	    cover.path AS path, r.id_permission AS permission,
        ARRAY_AGG(DISTINCT t.name) AS tags,
        ARRAY_AGG(DISTINCT i.name) AS ingredients,
        AVG(scr.score) AS score
FROM recipes r
JOIN difficulties d ON r.id_difficulty = d.id_difficulty
JOIN list_ingredients li ON r.id_recipe = li.id_recipe
JOIN ingredients i ON li.id_ingredient = i.id_ingredient
JOIN tag_list tl ON r.id_recipe = tl.id_recipe
JOIN tags t ON tl.id_tag = t.id_tag 
JOIN ratings scr ON r.id_recipe = scr.id_recipe
LEFT JOIN cover_image cover ON r.id_recipe = cover.id_recipe AND cover.img_rank <= 1
GROUP BY r.id_recipe, r.name, d.name, cover.path;