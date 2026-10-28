--- SELECT --- 

SELECT * FROM task_categories;

SELECT user_id, workspace_id, name, color 
	FROM task_categories
	WHERE workspace_id IS NOT NULL;

SELECT user_id, name, color 
	FROM task_categories
	WHERE color = '#3498db';

--- INSERT --- 

INSERT INTO task_categories (
    user_id, workspace_id, name, color
) VALUES 
	(2, 1, 'New_task_category', DEFAULT),
	(3, 2, 'User3_category', '#ffe4e1'),
	(3, Null, 'Work_category', DEFAULT);

--- UPDATE --- 

UPDATE task_categories
	SET workspace_id = Null
	WHERE id = 1;

UPDATE task_categories 
	SET color = '#a3b899'
	WHERE color = '#f8f8f8'; -- DEFAULT '#f8f8f8'

UPDATE task_categories
	SET name = 'Sport' 
	WHERE id = 3;

--- DELETE --- 

DELETE FROM task_categories
	WHERE id > 3;
