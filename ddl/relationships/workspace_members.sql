CREATE TABLE WORKSPACE_MEMBERS (
                                   user_id INTEGER NOT NULL,
                                   workspace_id INTEGER NOT NULL,
                                   role VARCHAR(50) CHECK (role IN ('ADMIN', 'OWNER', 'MEMBER', 'GUEST')),
                                   status VARCHAR(50) CHECK (status IN ('ACTIVE', 'INVITED', 'DEACTIVATED', 'ARCHIVED')),
                                   joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

                                   PRIMARY KEY (user_id, workspace_id),
                                   FOREIGN KEY (user_id) REFERENCES USERS(id),
                                   FOREIGN KEY (workspace_id) REFERENCES WORKSPACES(id)
);