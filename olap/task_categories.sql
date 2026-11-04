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

-- LEFT JOIN
SELECT 
	u.id, u.name, 
	COUNT (
		DISTINCT 
		CASE 
			WHEN u.id = w.owner_id 
			THEN w.id
			ELSE NULL
		END
	) AS total_workspaces, 
	COUNT(DISTINCT tc.id) AS total_categories
FROM task_categories AS tc 
LEFT JOIN users AS u ON 
	tc.user_id = u.id
INNER JOIN workspaces AS w ON 
	tc.workspace_id = w.id 
GROUP BY u.id, u.name;
		
-- RIGHT JOIN --
SELECT u.id AS user_id, u.name, u.email, tc.id, tc.name, tc.color
	FROM task_categories AS tc 
	RIGHT JOIN users AS u ON tc.user_id = u.id;
