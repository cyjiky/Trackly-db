CREATE TABLE workspace_members (
                                   user_id BIGINT NOT NULL,
                                   workspace_id BIGINT NOT NULL,
                                   role VARCHAR(50) CHECK (role IN ('ADMIN', 'OWNER', 'MEMBER', 'GUEST')),
                                   status VARCHAR(50) CHECK (status IN ('ACTIVE', 'INVITED', 'DEACTIVATED', 'ARCHIVED')),
                                   joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

                                   PRIMARY KEY (user_id, workspace_id),
                                   FOREIGN KEY (user_id) REFERENCES users(id),
                                   FOREIGN KEY (workspace_id) REFERENCES wokrspases(id)
);