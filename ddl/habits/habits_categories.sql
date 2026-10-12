CREATE TABLE habits_categories (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- cascade deletion since habits categories are not related to collaborative work in workspaces --
    user_id BIGINT REFERENCES users (id) ON DELETE CASCADE,
    name VARCHAR(256) NOT NULL,
    color VARCHAR(8) NOT NULL DEFAULT '#fff9e2', -- hexadecimal notation --
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    deleted_at TIMESTAMPTZ NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
)
