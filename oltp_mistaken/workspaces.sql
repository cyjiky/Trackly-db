
--- INSERT --- 
INSERT INTO workspaces (owner_id,name)
VALUES (1 , 'STUDY');

INSERT INTO workspaces (owner_id,name,description,status)
VALUES (2, 'Ivan','Text','ACTIVE');

--- UPDATE --- 

UPDATE workspaces
    SET name = 'KIRILL'
    WHERE id = 4;

--- DELETE --- 

DELETE FROM workspaces
    WHERE id = 1;

--- SELECT --- 
    
SELECT * FROM workspaces;

SELECT * FROM workspace_members WHERE user_id = 3; 
