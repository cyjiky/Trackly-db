--- INSERT ---

INSERT INTO habit_completions (
    habit_id, local_timestamp, completed_at, actual_value, note, status
)
VALUES
    (
        1, CURRENT_DATE + TIME '07:30:00',
        CURRENT_TIMESTAMP, 35, 'Ran 5 kilometers', 'COMPLETED'
    ),
    (
        2, CURRENT_DATE + TIME '21:00:00',
        CURRENT_TIMESTAMP, 25, 'Read 25 pages', 'COMPLETED'
    ),
    (
        3, CURRENT_DATE + TIME '09:00:00',
        CURRENT_TIMESTAMP, NULL, 'Skipped daily planning', 'COMPLETED'
    );

--- SELECT ---

SELECT habit_id, local_timestamp, completed_at, actual_value, note, status
FROM habit_completions
ORDER BY local_timestamp DESC;

SELECT *
FROM habit_completions
WHERE habit_id = 1 AND status = 'COMPLETED';

--- UPDATE ---

UPDATE habit_completions
SET actual_value = 40, note = 'Ran 6 kilometers'
WHERE habit_id = 1 AND local_timestamp = CURRENT_DATE + TIME '07:30:00'
RETURNING *;

UPDATE habit_completions
SET status = 'SKIPPED', actual_value = NULL, note = 'Skipped today'
WHERE habit_id = 1 AND local_timestamp = CURRENT_DATE + TIME '07:30:00'
RETURNING *;

SELECT * FROM habits; -- Inspect the changes --

--- DELETE ---

DELETE FROM habit_completions
WHERE habit_id = 1 AND local_timestamp = CURRENT_DATE + TIME '07:30:00'
RETURNING *;

SELECT * FROM habits; -- Inspect the changes --
