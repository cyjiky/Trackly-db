--- SELECT --- 

SELECT * FROM tasks; 

SELECT id, name, description FROM tasks
    WHERE status = 'done';

SELECT * FROM tasks
    WHERE creator_id = 1;

--- INSERT --- 

INSERT INTO tasks (name, priority, creator_id, status, created_at) VALUES
    ('Yoga', 3, 2, 'open', CURRENT_TIMESTAMP),
    ('Play piano', 5, 1,'done', CURRENT_TIMESTAMP);

INSERT INTO tasks (name, creator_id) VALUES 
    ('NEW TASK', 3);

--- UPDATE --- 

UPDATE tasks 
    SET description = 'uncategorized'
    WHERE category_id IS NULL;

UPDATE tasks 
    SET description = 'without priority'
    WHERE priority IS NULL;

--- DELETE --- 

DELETE FROM tasks
    WHERE description = 'uncategorized' OR description = 'without priority';

DELETE FROM tasks
    WHERE workspace_id = 3;
