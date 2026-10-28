--- INSERT ---

INSERT INTO habits (
    name, description, creator_id, category_id,
    timezone, frequency_days, status, start_day
)
VALUES
    (
        'Morning Run',
        'Run for at least 30 minutes',
        1, 1,
        'Europe/Berlin', ARRAY[1, 3, 5]::SMALLINT[], 'ACTIVE', CURRENT_DATE
    ),
    (
        'Read a Book',
        'Read at least 20 pages per day',
        1, 2,
        'Europe/Berlin', ARRAY[1, 2, 3, 4, 5, 6, 7]::SMALLINT[], 'ACTIVE', CURRENT_DATE
    ),
    (
        'Plan the Day',
        'Write down the most important tasks for the day',
        2, 3,
        'Europe/Berlin', ARRAY[1, 2, 3, 4, 5]::SMALLINT[], 'PAUSED', CURRENT_DATE
    );

--- SELECT ---

SELECT name, description, timezone, status, start_day
FROM habits
ORDER BY id
LIMIT 2;

SELECT *
FROM habits
WHERE name = 'Plan the Day';

--- UPDATE --- 

UPDATE habits
SET timezone = 'Europe/London', frequency_days = ARRAY[1, 3, 5], status = 'ACTIVE'
WHERE name = 'Plan the Day' AND status = 'PAUSED'
RETURNING *;

UPDATE habits
SET status = 'PAUSED'
WHERE creator_id = 1;

SELECT * FROM habits; -- Inspect the changes --

--- DELETE ---

DELETE FROM habits
WHERE status = 'PAUSED'
RETURNING *;

SELECT * FROM habits; -- Inspect the changes --
