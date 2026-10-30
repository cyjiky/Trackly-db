-- COUNT --
SELECT COUNT (DISTINCT priority)
	FROM tasks;

SELECT COUNT(priority)
	FROM tasks
	WHERE priority = 1;

-- MIN --
SELECT MIN(length(status))
	FROM tasks;

-- MAX -- 
SELECT MAX(length(status))
	FROM tasks;

-- GROUP BY --
SELECT COUNT(id), status
	FROM tasks
	GROUP BY status;

-- HAVING --
SELECT COUNT(id), status
	FROM tasks
	GROUP BY status
	HAVING COUNT(id) > 2;

-- LEFT JOIN --
SELECT tasks.id, tasks.name, priority
	FROM tasks 
	LEFT JOIN task_categories ON tasks.category_id = task_categories.id;

-- RIGHT JOIN -- 
SELECT task_categories.id, task_categories.name
	FROM task_categories
	RIGHT JOIN tasks ON task_categories.id = tasks.category_id;

-- FULL JOIN --
SELECT tasks.id, tasks.name, tasks.priority
	FROM tasks
	FULL JOIN task_categories ON tasks.category_id = task_categories.id;