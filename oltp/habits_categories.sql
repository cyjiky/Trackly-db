--- INSERT ---

INSERT INTO habits_categories (user_id, name, color)
VALUES
    (1, 'Health', '#2ecc71'),
    (1, 'Learning', '#3498db'),
    (2, 'Productivity', '#f39c12');

--- SELECT ---

SELECT * FROM habits_categories;

SELECT id, user_id, name, color
FROM habits_categories
WHERE user_id = 1;

--- UPDATE --- 

UPDATE habits_categories
SET color = '#27ae60', updated_at = CURRENT_TIMESTAMP
WHERE user_id = 1 AND name = 'Health'
RETURNING *;

SELECT * FROM habits; -- Inspect the changes --

--- DELETE --- 

DELETE FROM habits_categories
WHERE user_id = 2 AND name = 'Productivity'
RETURNING *;

SELECT * FROM habits; -- Inspect the changes --
