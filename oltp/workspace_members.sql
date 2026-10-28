
--- INSERT --- 
INSERT INTO workspace_members (user_id, workspace_id, role, status)
    VALUES (2, 1, 'ADMIN', 'ACTIVE');

--- UPDATE --- 
-- UPDATE workspace_members
--     SET role = 'GUEST'
--     WHERE id = 1;

UPDATE workspace_members 
    SET role = 'OWNER' 
    WHERE user_id = 2 AND workspace_id = 1;

--- DELETE --- 

-- DELETE FROM workspace_members
--     WHERE workspace_id = 4;

DELETE FROM workspace_members 
    WHERE user_id = 1 AND workspace_id = 3;

    --- SELECT --- 
    
SELECT * FROM workspace_members;

SELECT user_id, workspace_id, role, status, joined_at 
    FROM workspace_members;

SELECT user_id, role, status FROM workspace_members; 
