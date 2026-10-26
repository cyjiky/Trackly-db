--- SELECT --- 

SELECT * FROM task_categories;

SELECT id, user_id, name, color FROM task_categories
    WHERE user_id = 1;

SELECT id, user_id, name, color FROM task_categories
    WHERE LENGTH(name) > 10;

--- INSERT --- 

INSERT INTO task_categories (user_id, name) VALUES
    (3, 'Sport')
    (3, 'English learn');

INSERT INTO task_categories (user_id, name, color) VALUES 
    (2, 'DEUTSCH LERNEN', '#FF0000');

--- UPDATE --- 

UPDATE task_categories 
    SET color = '#FFC0CB'
    WHERE workspace_id = 3;

--- DELETE --- 

DELETE FROM task_categories
    WHERE workspace_id IS NULL;