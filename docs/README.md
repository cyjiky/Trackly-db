# Trackly-db-Course 

База даних для сервісу трекінгу звичок та управління завданнями Trackly


## Основні функції програми

1. Управління завданнями - планування поточних справ, розстановка пріоритетів та дедлайнів
2. Трекінг звичок - формування рутин, відстеження серій виконання та підтримання регулярності
3. Спільна робота - шеринг завдань з іншими користувачами та командне виконання
4. Аналітика та статистика - перегляд звітів про продуктивність для оцінки прогресу та оптимізації


## Результати аналізу вимог

Trackly - сервіс трекінгу звичок та управління завданнями. 


### Потреби зацікавлених сторін

#### Індивідуальні користувачі
- Створення та закріплення корисних звичок через регулярні нагадування, розклад та візуалізацію безперервних серій
- Зручне планування щоденних завдань, розстановка пріоритетів та оптимізація робочого часу
- Автоматичний розрахунок дедлайнів і виконання дій з урахуванням часового поясу користувача
- Збереження історії та статистики продуктивності для рефлексії та покращення результатів

#### Командна робота (Workspaces)
- Організація спільного простору для команди чи проєкту
- Розподіл завдань між учасниками, призначення відповідальних виконавців та контроль статусу
- Моніторинг командних дедлайнів, завантаженості та загальних показників прогресу
- Розмежування рівнів доступу


### Концептуальний дизайн

- Сутності: Users, Habits, HabitCompletions, Tasks, Workspaces, WorkspaceMembers, Categories, TaskCategories, HabitCategories
- Атрибути:
  - Users: id, name, nickname, phone_number, password, email, timezone, created_at
  - Habits: id, name, description, creator_id, timezone, status, start_date, end_date, created_at, deleted_at
  - HabitCompletions: id, habit_id, completed_at, note
  - Tasks: id, name, description, status, priority, creator_id, assignee_id, workspace_id, created_at, deadline, deleted_at, updated_at
  - Categories: id, name, color, owner_id, workspace_id, created_at, deleted_at
  - Workspaces: id, name, description, owner_id, created_at
  - WorkspaceMembers: user_id, workspace_id, role, joined_at
  - TaskCategories: task_id, category_id
  - HabitCategories: habit_id, category_id


#### Бізнес-зв'язки

1. Один User може мати декілька Habits, Tasks, Workspaces
2. У Habits, Tasks, Workspaces може бути лише один творець
3. Одна Category може мати декілька Tasks, Habits


### Бізнес-правила та обмеження цілісності

- Акаунти 
  - пошта, нікнейм та номер телефону - унікальні дані
  - облік виконання розраховується щодо часового поясу користувача

- Habits & Completions
  - звичка має creator_id, timezone, status, start_date, end_date, created_at, deleted_at
  - запис виконання має habit_id, completed_at, note

- Tasks 
  - creator_id, assignee_id, workspace_id, created_at, deadline, deleted_at, updated_at
  - deadline може бути null

- Workspaces 
  - workspace має owner_id, name, description, created_at
  - учасники пов'язані через WorkspaceMembers

- Categories 
  - category має id, name, color, owner_id, workspace_id, created_at, deleted_at
  - один користувач або workspace може мати багато категорій

- Many-to-many зв'язки
  - TaskCategories: task_id, category_id
  - HabitCategories: habit_id, category_id


### Use Cases

| Сценарій | Тип операції | Вимога | 
| --- | --- | --- |
| --- | --- | --- |


### [Діаграма](./diagramm.mmd) 