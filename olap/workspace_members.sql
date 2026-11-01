-- COUNT --
SELECT COUNT(*)
FROM workspace_members;

SELECT COUNT(DISTINCT user_id)
FROM workspace_members;

-- DISTINCT + ORDER BY --
SELECT DISTINCT role
FROM workspace_members
ORDER BY role ASC;

-- WHERE --
SELECT *
FROM workspace_members
WHERE status = 'ACTIVE';

-- GROUP BY --
SELECT workspace_id, COUNT(*) AS members_count
FROM workspace_members
GROUP BY workspace_id
ORDER BY workspace_id ASC;

-- HAVING --
SELECT workspace_id, COUNT(*) AS members_count
FROM workspace_members
GROUP BY workspace_id
HAVING COUNT(*) > 1;

-- INNER JOIN --
SELECT wm.workspace_id, u.nickname, wm.role
FROM workspace_members wm
INNER JOIN users u ON u.id = wm.user_id
ORDER BY wm.workspace_id ASC;

-- LEFT JOIN --
SELECT u.nickname, wm.workspace_id, wm.role
FROM users u
LEFT JOIN workspace_members wm ON wm.user_id = u.id;

-- RIGHT JOIN --
SELECT u.nickname, wm.workspace_id, wm.role
FROM users u
RIGHT JOIN workspace_members wm ON wm.user_id = u.id;

-- FULL JOIN --
SELECT u.nickname, wm.workspace_id, wm.role
FROM users u
FULL JOIN workspace_members wm ON wm.user_id = u.id;

-- CROSS JOIN --
SELECT u.nickname, wm.workspace_id
FROM users u
CROSS JOIN workspace_members wm;