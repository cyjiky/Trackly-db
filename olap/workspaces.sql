-- COUNT --
SELECT COUNT(*)
FROM workspaces;

SELECT COUNT(DISTINCT owner_id)
FROM workspaces;

-- DISTINCT + ORDER BY --
SELECT DISTINCT status
FROM workspaces
ORDER BY status ASC;

-- WHERE --
SELECT id, name, status --
FROM workspaces-- 
WHERE deleted_at IS NULL; -- исправить 

-- GROUP BY --
SELECT status, COUNT(*) AS total
FROM workspaces
GROUP BY status
ORDER BY total DESC;

-- INNER JOIN --
SELECT w.id, w.name, u.nickname AS owner
FROM workspaces w
INNER JOIN users u ON u.id = w.owner_id
ORDER BY w.id ASC;

-- LEFT JOIN --
SELECT u.nickname, w.name
FROM users u
LEFT JOIN workspaces w ON w.owner_id = u.id;

-- RIGHT JOIN --
SELECT u.nickname, w.name
FROM users u
RIGHT JOIN workspaces w ON w.owner_id = u.id;

-- FULL JOIN --
SELECT w.name, wm.user_id, wm.role
FROM workspaces w
FULL JOIN workspace_members wm ON wm.workspace_id = w.id;

-- CROSS JOIN --
SELECT u.nickname, w.name
FROM users u
CROSS JOIN workspaces w;