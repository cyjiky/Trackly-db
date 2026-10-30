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
SELECT task_categories.id, task_categories.name, user_id -- user_id == task_categories.creator_id
	FROM task_categories
	INNER JOIN tasks ON task_categories.user_id = tasks.creator_id
	ORDER BY user_id ASC;

SELECT *
	FROM task_categories
	INNER JOIN tasks ON task_categories.workspace_id = tasks.workspace_id;

-- LEFT JOIN --
SELECT *
	FROM task_categories
	LEFT JOIN tasks ON task_categories.workspace_id = tasks.workspace_id;

-- RIGHT JOIN --
SELECT *
	FROM task_categories
	RIGHT JOIN tasks ON task_categories.workspace_id = tasks.workspace_id;

-- FULL JOIN --
SELECT *
	FROM task_categories
	FULL JOIN tasks ON task_categories.workspace_id = tasks.workspace_id;

-- CROSS JOIN -- 
SELECT *
	FROM task_categories
	CROSS JOIN tasks;