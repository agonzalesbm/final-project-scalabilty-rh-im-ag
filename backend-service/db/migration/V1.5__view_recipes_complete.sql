CREATE VIEW recipes_complete_view AS
SELECT r.id_recipe AS id, r.name, 
	   r.preparation_time as preptime,
	   r.cooking_time as cooktime,
	   r.portions,
	   r.id_creator AS author,
	   r.name_creator AS author_name,
	   r.id_permission AS permission,
	   d.name AS difficulty,
       ARRAY_AGG(DISTINCT t.name) AS tags,
       ARRAY_AGG(DISTINCT i.name) AS ingredients,
	   ARRAY_AGG(DISTINCT img.path) AS paths,
	   ARRAY_AGG(DISTINCT inst.step) AS steps,
       AVG(scr.score) AS score
FROM recipes r
LEFT JOIN difficulties d ON r.id_difficulty = d.id_difficulty
LEFT JOIN list_ingredients li ON r.id_recipe = li.id_recipe
LEFT JOIN ingredients i ON li.id_ingredient = i.id_ingredient
LEFT JOIN tag_list tl ON r.id_recipe = tl.id_recipe
LEFT JOIN tags t ON tl.id_tag = t.id_tag 
LEFT JOIN ratings scr ON r.id_recipe = scr.id_recipe
LEFT JOIN images_list img ON r.id_recipe = img.id_recipe
LEFT JOIN instructions inst ON r.id_recipe = inst.id_recipe
GROUP BY r.id_recipe, r.name, d.name;