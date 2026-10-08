CREATE TABLE habits (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(256) NOT NULL,
    description TEXT NULL,
    creator_id BIGINT NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    category_id BIGINT NULL REFERENCES habits_categories (id) ON DELETE SET NULL,
    timezone VARCHAR(32) NOT NULL DEFAULT 'Etc/UTC', -- IANA tz format --
    -- array_length(frequency_days, 1), where 1 stands for array dimension which length the function computes --
    frequency_days SMALLINT[] NOT NULL DEFAULT ARRAY[1, 2, 3, 4, 5, 6, 7] CHECK (
        array_ndims(frequency_days) = 1 AND
        cardinality(frequency_days) BETWEEN  1 AND 7
    ),
    status VARCHAR(16) NOT NULL DEFAULT 'ACTIVE',
    start_day DATE NULL,
    end_day DATE NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    deleted_at TIMESTAMPTZ NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now() 
);

