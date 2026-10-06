CREATE Table task_categories (
    tasks_id INTEGER REFERENCES tasks(id) ON DELETE CASCADE, 
    categories_id INTEGER REFERENCES categories(id) ON DELETE CASCADE, 
    PRIMARY KEY (tasks_id, categories_id)
);