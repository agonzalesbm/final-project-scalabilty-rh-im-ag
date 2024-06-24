INSERT INTO ratings (id_recipe, id_user, score)
VALUES 
(1,'1',2),
(2,'1',4),
(3,'1',3),
(4,'1',2),
(5,'1',3),
(6,'1',3),
(7,'1',3),
(8,'1',3),
(9,'1',3),
(10,'1',3),
(11,'1',3),
(12,'1',3),
(13,'1',3);


INSERT INTO images_list (path, id_recipe)
VALUES ('/img/recipe/pastaConTomate.jpg',1), 
       ('/img/recipe/guacamole.jpg',2),
       ('/img/recipe/Pancakes.jpg',3),
       ('/img/recipe/pique_macho.jpg',4),
       ('/img/recipe/CaldoDePollo.jpg',5),
       ('/img/recipe/Sopa-de-fideos.jpg',6),
       ('/img/recipe/chuleta.jpg',7),
       ('/img/recipe/tarta_fresa.jpg',8),
       ('/img/recipe/ensalada_de_fruta.jpg',9),
       ('/img/recipe/Salpicon-de-pollo.jpg',10),
       ('/img/recipe/saltenia.jpg',11),
       ('/img/recipe/falso_conejo.jpg',12),
       ('/img/recipe/silpancho.jpg',13);

CREATE VIEW recipes_search AS
WITH cover_image AS (
    SELECT r.id_recipe, img.path AS path,
           ROW_NUMBER() OVER (PARTITION BY r.id_recipe) AS img_rank
    FROM recipes r
    JOIN images_list img ON r.id_recipe = img.id_recipe
)
SELECT r.id_recipe AS id, r.name, d.name AS difficulty,
	   cover.path AS path,
          p.id_permission AS permission,
       ARRAY_AGG(DISTINCT t.name) AS tags,
       ARRAY_AGG(DISTINCT i.name) AS ingredients,
       AVG(scr.score) AS score
FROM recipes r
JOIN permissions p ON r.id_permission = p.id_permission
JOIN difficulties d ON r.id_difficulty = d.id_difficulty
JOIN list_ingredients li ON r.id_recipe = li.id_recipe
JOIN ingredients i ON li.id_ingredient = i.id_ingredient
JOIN tag_list tl ON r.id_recipe = tl.id_recipe
JOIN tags t ON tl.id_tag = t.id_tag 
JOIN ratings scr ON r.id_recipe = scr.id_recipe
LEFT JOIN cover_image cover ON r.id_recipe = cover.id_recipe AND cover.img_rank <= 1

GROUP BY r.id_recipe, r.name, d.name, cover.path, p.name, p.id_permission;