-- COUNT -- 
SELECT COUNT(timezone)
	FROM users;

-- DISTINCT --
SELECT DISTINCT(timezone)
	FROM users;

-- HAVING --
SELECT COUNT(id), timezone 
	FROM users
	GROUP BY timezone 
	HAVING COUNT (id) > 1;

-- ORDER BY --
SELECT id, name, timezone 
    FROM users
    ORDER BY timezone ASC;
