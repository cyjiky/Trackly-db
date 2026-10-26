--- SELECT ---
SELECT * FROM workspace_members;
SELECT user_id, workspace_id, role, status, joined_at FROM workspace_members;

--- INSERT ---
INSERT INTO workspace_members (user_id, workspace_id, role, status) 
VALUES (1, 3, 'ADMIN', 'ACTIVE');

INSERT INTO workspace_members (user_id, workspace_id, role, status) 
VALUES (2, 3, 'GUEST', 'INVITED');
--- UPDATE ---
UPDATE workspace_members 
SET role = 'ADMIN' 
WHERE user_id = 1 AND workspace_id = 3;

UPDATE workspace_members 
SET status = 'DEACTIVATED' 
WHERE user_id = 2 AND workspace_id = 3;

--- DELETE ---
DELETE FROM workspace_members 
WHERE user_id = 1 AND workspace_id = 3;

DELETE FROM workspace_members 
WHERE user_id = 2 AND workspace_id = 3;