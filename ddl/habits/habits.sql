CREATE TABLE habits (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(256) NOT NULL,
    description TEXT NULL,
    creator_id BIGINT NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    category_id BIGINT NULL REFERENCES habits_categories (id) ON DELETE SET NULL,
    timezone VARCHAR(32) NOT NULL DEFAULT 'Etc/UTC', -- IANA tz format --
    frequency_days SMALLINT[7] NOT NULL DEFAULT ARRAY[1, 2, 3, 4, 5, 6, 7],
    status VARCHAR(16) NOT NULL DEFAULT 'ACTIVE',
    start_day DATE NULL,
    end_day DATE NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    deleted_at TIMESTAMPTZ NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

