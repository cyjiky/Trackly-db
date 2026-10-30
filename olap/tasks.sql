-- COUNT --
SELECT COUNT (DISTINCT priority)
	FROM tasks;

SELECT COUNT(priority)
	FROM tasks
	WHERE priority = 1;

-- MIN --
SELECT MIN(priority)
	FROM tasks;

-- MAX -- 
SELECT MAX(priority)
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
SELECT tasks.id, tasks.name, priority, tasks.category_id
	FROM tasks 
	LEFT JOIN task_categories ON tasks.category_id = task_categories.id
	ORDER BY tasks.category_id;

-- RIGHT JOIN -- 
SELECT task_categories.id, task_categories.name
	FROM task_categories
	RIGHT JOIN tasks ON task_categories.id = tasks.category_id
	ORDER BY tasks.category_id;

SELECT DISTINCT task_categories.id, task_categories.name 
	FROM task_categories
	RIGHT JOIN tasks ON task_categories.id = tasks.category_id;

-- FULL JOIN --
SELECT tasks.id, tasks.name, tasks.priority, tasks.category_id
	FROM tasks
	FULL JOIN task_categories ON tasks.category_id = task_categories.id;