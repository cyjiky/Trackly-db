--- SELECT ---
SELECT * FROM workspaces;
SELECT id, name, status, owner_id FROM workspaces;

--- INSERT ---
INSERT INTO workspaces (owner_id, name, description, status) 
VALUES (1, 'Marketing', 'Market', 'ACTIVE');

INSERT INTO workspaces (owner_id, name, description, status) 
VALUES (2, 'Design', 'Desing project', 'ACTIVE');

--- UPDATE ---
UPDATE workspaces 
SET name = 'Personal & Side Projects', status = 'ACTIVE' 
WHERE id = 1;

UPDATE workspaces 
SET description = 'Test text ' 
WHERE id = 2;

--- DELETE ---
DELETE FROM workspaces 
WHERE id = 2;

DELETE FROM workspaces 
WHERE status = 'SUSPENDED';