-- Show how a user's habit completions are distributed by status.
SELECT completion_status,
       count(*) completions
FROM (
    SELECT hc.id, habit_id, hc.status completion_status
    FROM habit_completions hc
    INNER JOIN habits h ON hc.habit_id = h.id
    WHERE h.creator_id = :user_id
) completions
GROUP BY completion_status;