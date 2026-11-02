-- Compare workspace sizes among workspaces with the same number of timezones.
WITH workspace_timezones AS (
    SELECT workspaces.id,
           workspaces.name,
           COUNT(DISTINCT timezone) as distinct_timezones,
           COUNT(*) as participants_count
    FROM workspace_members
    JOIN users on workspace_members.user_id = users.id
    JOIN workspaces ON workspaces.id = workspace_members.workspace_id
    GROUP BY workspaces.id, workspaces.name
)
SELECT workspace_timezones.name,
       distinct_timezones,
       ROUND(AVG(participants_count) OVER distinct_timezones_partition, 2) AS average_participants_by_distinct_number_of_timezones,
       participants_count
FROM workspace_timezones
WINDOW distinct_timezones_partition AS (PARTITION BY distinct_timezones)
ORDER BY distinct_timezones, participants_count DESC;