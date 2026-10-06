-- Active: 1785143846383@@mysql-8-parser.groupbwt.com@3306@upwork-education
CREATE TABLE habits (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(256),
    description TEXT NULL,
    creator_id BIGINT NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    timezone VARCHAR(32) DEFAULT 'Etc/UTC', -- IANA tz format --
    reset_time TIME DEFAULT time('00:00:00'),
    created_at TIMESTAMPTZ DEFAULT now(),
    deleted_at TIMESTAMPTZ NULL
);

