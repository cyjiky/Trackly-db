CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT, 
    status VARCHAR(30) NOT NULL DEFAULT 'open'
        CHECK (status IN ('open', 'in_progress', 'done', 'closed', 'cancelled')),
    priority INTEGER CHECK (priority > 0), 
    creator_id INTEGER NOT NULL REFERENCES users(id) ON DELETE RESTRICT,
    assignee_id INTEGER REFERENCES users(id) ON DELETE SET NULL,
    workspace_id INTEGER REFERENCES workspaces(id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deadline TIMESTAMPTZ,
    deleted_at TIMESTAMPTZ,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_task_deadline CHECK (deadline IS NULL OR deadline >= created_at)
);
