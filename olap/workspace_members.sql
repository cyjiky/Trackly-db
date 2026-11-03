-- Compare each workspace member's assigned tasks with the group average.
SELECT u.name, u.email,
       COUNT(*) assigned_tasks,
        (
            SELECT COUNT(*)
            FROM tasks
            WHERE tasks.workspace_id = :workspace_id
                AND tasks.creator_id = workspace_members.user_id
                AND tasks.workspace_id IS NOT NULL
                AND tasks.deleted_at IS NULL
        ) created_tasks,
        AVG(COUNT(*)) OVER () average_assigned_tasks,
        ABS(COUNT(*) - (AVG(COUNT(*)) OVER ())) deviation_from_avg_tasks_assigned
FROM workspace_members
LEFT JOIN users u ON workspace_members.user_id = u.id
JOIN tasks ON workspace_members.user_id = tasks.assignee_id
WHERE workspace_members.workspace_id = :workspace_id
      AND tasks.workspace_id IS NOT NULL
      AND workspace_members.user_id = tasks.assignee_id
      AND workspace_members.status != 'DEACTIVATED'
GROUP BY u.name, u.email, workspace_members.user_id;