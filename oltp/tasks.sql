--- SELECT --- 

SELECT * FROM tasks; 

SELECT name, status, assignee_id 
	FROM tasks
	WHERE creator_id = 1;

SELECT * FROM tasks
    WHERE creator_id = 1;

--- INSERT --- 

INSERT INTO tasks (
	name, description, status, priority, creator_id, 
    assignee_id, workspace_id, category_id, deadline
) VALUES
	('New_workspace_1', NULL, DEFAULT, 1, 2, 3, 1, NULL, NULL),
	('New_workspace_2', 'Some text', 'done', NULL, 3, NULL, 1, NULL, NULL),
	('New_workspace_3', NULL, DEFAULT, NULL, 2, 3, 1, 1, NULL);

--- UPDATE --- 

UPDATE tasks 
    SET description = 'uncategorized'
    WHERE category_id IS NULL;

UPDATE tasks 
    SET description = 'without priority'
    WHERE priority IS NULL;

UPDATE tasks
	SET name = 'Homework'
	WHERE id = 1;

--- DELETE --- 

DELETE FROM tasks
    WHERE description = 'uncategorized' OR description = 'without priority';

DELETE FROM tasks
	WHERE id > 3;
