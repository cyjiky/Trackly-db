-- Compare users by their share of assigned tasks in a workspace.
WITH assignee_workload AS (
    SELECT assignee_id,
       SUM(COUNT(*)) OVER () AS total_tasks,
       COUNT(*) AS assignee_tasks,
       COUNT(*)::float / (SUM(COUNT(*)) OVER ())::float AS assignee_ratio
    FROM tasks
    WHERE workspace_id = :workspace_id AND assignee_id IS NOT NULL
    GROUP BY assignee_id
    HAVING COUNT(*) IS NOT NULL
)
SELECT *, MAX(assignee_ratio) OVER () as max_ration, MIN(assignee_ratio) OVER () as min_ratio
FROM assignee_workload
ORDER BY assignee_ratio DESC
LIMIT :n_users;