CREATE Table task_categories (
    tasks_id BIGINT REFERENCES tasks(id) ON DELETE CASCADE, 
    categories_id BIGINT REFERENCES categories(id) ON DELETE CASCADE, 
    PRIMARY KEY (tasks_id, categories_id)
);