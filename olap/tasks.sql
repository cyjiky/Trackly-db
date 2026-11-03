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
SELECT t.id, t.name, t.priority, t.category_id, tc.color
	FROM tasks AS t 
	LEFT JOIN task_categories AS tc ON t.category_id = tc.id
	ORDER BY t.category_id;

SELECT 
	u.id AS user_id, u.name, u.email, 
	t.id AS task_id, t.name AS task_name, 
	tc.id AS tc_id, tc.name AS tc_name, tc.color
	FROM tasks AS t 
	LEFT JOIN task_categories AS tc 
		ON tc.id = t.category_id
	LEFT JOIN users AS u
		ON u.id = t.assignee_id;

-- RIGHT JOIN -- 
SELECT t.id, t.name, t.priority, u.id, u.name, u.email
	FROM tasks AS t
	RIGHT JOIN users AS u ON t.creator_id = u.id
	ORDER BY u.id;

-- FULL JOIN --
SELECT t.name, t.status, u.id, u.name
	FROM tasks AS t
	FULL JOIN users AS u ON t.creator_id = u.id 
	ORDER BY u.id;