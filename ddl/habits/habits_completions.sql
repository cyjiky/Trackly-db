CREATE TABLE habit_completions (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    habit_id BIGINT REFERENCES habits (id) ON DELETE CASCADE,
    local_timestamp TIMESTAMPTZ NOT NULL, -- the timezone can be accessed via habits table --
    completed_at TIMESTAMPTZ DEFAULT now(),
    actual_value SMALLINT NULL,
    note TEXT NULL,
    status VARCHAR(256) NOT NULL
)
