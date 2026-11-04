-- COUNT -- 
SELECT COUNT(timezone)
	FROM users;

-- DISTINCT --
SELECT DISTINCT(timezone)
	FROM users;

-- LIKE --
SELECT * FROM users
WHERE name LIKE 'A%';

-- HAVING --
SELECT COUNT(id), timezone 
	FROM users
	GROUP BY timezone 
	HAVING COUNT (id) > 1;

-- ORDER BY --
SELECT id, name, timezone 
    FROM users
    ORDER BY timezone ASC;

-- CASE --
SELECT 
	u.name, 
	COUNT(DISTINCT t.id) AS total_tasks,
	CASE 
		WHEN t.status IN ('open', 'in_progress')
		THEN STRING_AGG(t.status, ', ') 
		ELSE NULL 
		END AS status, 
	u.email
FROM users AS u
INNER JOIN tasks AS t ON 
	t.creator_id = u.id OR 
	t.assignee_id = u.id
GROUP BY u.name, u.email, status
ORDER BY u.name ASC;

-- LEFT JOIN -- 
SELECT
	u.id, u.name, u.email,
	COUNT(DISTINCT t.id) AS total_tasks,
	COUNT(DISTINCT w.workspace_id) AS total_workspaces
FROM users AS u 
LEFT JOIN tasks AS t ON 
	t.creator_id = u.id OR t.assignee_id = u.id
LEFT JOIN workspace_members AS w ON
	w.user_id = u.id
GROUP BY u.id, u.name, u.email
ORDER BY u.id ASC;

-- INNER JOIN -- 
SELECT 
	u.id, u.name, u.email,
	COUNT(DISTINCT t.id) AS total_tasks
FROM users AS u 
INNER JOIN tasks AS t ON 
	t.creator_id = u.id 
WHERE t.category_id IS NOT NULL 
	AND t.workspace_id IS NOT NULL 
	AND EXISTS (
		SELECT 1
		FROM task_categories AS tc
		WHERE tc.user_id = t.creator_id
	)
GROUP BY u.id, u.name, u.email;

SELECT 
	u.id, u.name, u.email, 
	COUNT(DISTINCT t.id) AS total_tasks, 
	AVG(t.priority) AS AVG_priority, 
	MAX(t.priority),
	MIN(t.priority)
FROM users AS u 
INNER JOIN tasks AS t ON
	t.creator_id = u.id OR
	t.assignee_id = u.id 
WHERE t.category_id IS NOT NULL 
	AND t.workspace_id IS NOT NULL
GROUP BY u.id, u.name, u.email
HAVING COUNT(DISTINCT t.id) > 1;

SELECT 
	u.id, u.name, u.email, 
	COUNT(DISTINCT t.id) AS total_tasks,
	AVG(t.priority), 
	SUM(CASE WHEN t.status = 'done' THEN 0 ELSE 1 END) AS done,
	MIN(t.deadline)
FROM users AS u 
INNER JOIN tasks AS t ON
	t.assignee_id = u.id 
	AND EXISTS (
		SELECT 1
		FROM task_categories AS tc 
		WHERE tc.user_id != t.assignee_id
	)
GROUP BY u.id, u.name, u.email, status;