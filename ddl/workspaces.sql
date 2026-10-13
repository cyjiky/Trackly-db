CREATE TABLE workspaces (
                            id BIGSERIAL PRIMARY KEY,
                            owner_id BIGINT NOT NULL,
                            name VARCHAR(100) NOT NULL,
                            description TEXT,
                            status VARCHAR(50) CHECK (status IN ('ACTIVE', 'ARCHIVED', 'SUSPENDED')),
                            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

                            FOREIGN KEY (owner_id) REFERENCES users(id)
);