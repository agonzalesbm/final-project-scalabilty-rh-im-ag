
INSERT INTO permissions (name)
VALUES ('PUBLIC'),('PRIVATE');

INSERT INTO difficulties (name, description)
VALUES
    ('Easy', 'Recipes that are quick and easy to make.'),
    ('Medium', 'Recipes that require some preparation and cooking skills.'),
    ('Hard', 'Recipes that are more complex and challenging to make.');


INSERT INTO tags (name, description) VALUES
    ('Vegan', 'Recipes without animal-derived ingredients'),
    ('Dessert', 'Recipes for sweet desserts'),
    ('Vegetarian', 'Recipes that exclude meat but may include other animal products'),
    ('Gluten-free', 'Recipes without gluten, suitable for people with gluten intolerance'),
    ('Dinner',NULL),
    ('Healthy',NULL),
    ('Appetizer',NULL),
    ('Acid', NULL),
    ('Breakfast', 'Recipes for breakfast, such as pancakes, eggs, and smoothies');

INSERT INTO ingredients (name, calories) VALUES
    ('Chicken breast', 165.0),
    ('Ground beef', 250.0),
    ('Carrots', 41.0),
    ('Potatoes', 77.0),
    ('White rice', 205.0),
    ('Broccoli', 55.0),
    ('Lentils', 230.0),
    ('Canned beans', 260.0),
    ('Spinach', 23.0),
    ('Eggs', 78.0),
    ('Dried Spaghetti', 371.0),
    ('Canned Tomatoes', 18.0),
    ('Small Onion', 28.0),
    ('Garlic Cloves', 4.0),
    ('Salt', 0.0),
    ('Black Pepper', 0.0),
    ('Ripe Avocados', 322.0),
    ('Small Tomato', 3.0),
    ('Jalapeno Pepper', 4.0),
    ('Lime Juice', 8.0),
    ('all-purpose flour', NULL),
    ('baking powder', NULL),
    ('white sugar', NULL),
    ('milk', NULL),
    ('butter, melted', NULL),
    ('vanilla extract', NULL);


INSERT INTO measurement_units (name, abbreviation) VALUES
    ('Grams', 'g'),
    ('Kilograms', 'kg'),
    ('Ounces', 'oz'),
    ('Pounds', 'lb'),
    ('Teaspoons', 'tsp'),
    ('Tablespoons', 'tbsp'),
    ('Fluid ounces', 'fl oz'),
    ('Cups', 'cup'),
    ('Milliliters', 'ml'),
    ('Liters', 'l'),
    ('Unid', 'u');
