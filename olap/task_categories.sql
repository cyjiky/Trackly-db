-- COUNT -- 
SELECT COUNT(workspace_id)
	FROM task_categories;

SELECT COUNT(DISTINCT user_id)
	FROM task_categories;

-- ORDER BY --
SELECT DISTINCT name
	FROM task_categories
	ORDER BY name ASC;

-- INNER JOIN --
SELECT u.id, u.name, u.email, t.id AS task_id, t.name, t.status, tc.id AS tc_id, tc.name
	FROM task_categories AS tc
	INNER JOIN tasks AS t ON tc.id = t.category_id
	INNER JOIN users AS u ON tc.user_id = u.id
	ORDER BY tc.id ASC;

SELECT w.name, w.status, tc.*
	FROM task_categories AS tc 
	INNER JOIN workspaces AS w ON tc.workspace_id = w.id;

-- LEFT JOIN --> TODO
SELECT 
	u.id AS user_id, u.name, u.email, 
	t.id AS task_id, t.name AS task_name, 
	tc.id AS tc_id, tc.name AS tc_name, tc.color
	FROM tasks AS t 
	LEFT JOIN task_categories AS tc 
		ON tc.id = t.category_id;
		
-- RIGHT JOIN --
SELECT u.id AS user_id, u.name, u.email, tc.id, tc.name, tc.color
	FROM task_categories AS tc 
	RIGHT JOIN users AS u ON tc.user_id = u.id;
