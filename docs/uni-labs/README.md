# Trackly-db-Course

**Дисципліна:** «Бази даних»  
**Заклад:** Національний технічний університет України «Київський політехнічний інститут імені Ігоря Сікорського»

## Таблиця лабораторних робіт

|  #  | Назва лабораторної роботи                   |     Посилання     |
| :-: | :------------------------------------------ | :---------------: |
|  1  | Збір вимог та розробка схеми ER             | [Lab1](./Lab1.md) |
|  2  | Перетворення ER-діаграми у схему PostgreSQL |        ---        |
|  3  | SQL OLTP - маніпулювання даними             |        ---        |
|  4  | SQL OLAP - аналітичні запити                |        ---        |
|  5  | Нормалізація баз даних                      |        ---        |
|  6  | Міграції схем (Prisma ORM)                  |        ---        |

## Модель розгалуження Git (Branching Strategy)

Використовується багаторівнева модель гілкування для організації командної роботи над лабораторними роботами

### Призначення основних гілок:

- `main` - стабільна версія проєкту із фінальними, перевіреними звітами та кодом
- `dev` - загальна гілка розробки, куди інтегруються готові завдання перед релізом у `main`
- `docs` / `lab-N` - гілки для конкретних лабораторних робіт або модулів документації
- `dev_*` (`dev_vu`, `dev_yr`, `dev_kp`) — персональні гілки

1. Загальний цикл лабораторних робіт

```mermaid
gitGraph
    commit id: "Initial commit"
    branch docs
    checkout docs
    commit id: "Lab1"
    checkout main
    merge docs

    branch dev
    checkout dev
    commit id: "Lab2"

    checkout dev
    commit id: "Lab3"
    branch lab-3
    commit
    checkout dev
    merge lab-3

    checkout main
    merge dev

    checkout dev
    commit id: "Lab4"
    branch lab-4
    commit
    checkout dev
    merge lab-4

    checkout main
    merge dev

    checkout dev
    commit id: "Lab5"
    branch lab-5
    commit
    checkout dev
    merge lab-5

    checkout main
    merge dev

    checkout dev
    commit id: "Lab6"
    branch lab-6
    commit
    checkout dev
    merge lab-6

    checkout main
    merge dev
```

2. Детальна схема гілки docs (Lab1)

```mermaid
gitGraph
    commit id: "Initial commit"
    branch docs
    checkout docs
    commit id: "Lab1"


    branch docs_yr
    commit
    checkout docs
    commit

    merge docs_yr
    commit
    checkout main
    merge docs
```

3. Детальна схема для Lab2

```mermaid
gitGraph
    commit id: "Initial commit"
    branch dev
    checkout dev
    commit id: "Lab2"


    branch dev_vu
    branch dev_yr
    branch dev_kp

    checkout dev_vu
    commit

    checkout dev_yr
    commit

    checkout dev_kp
    commit

    checkout dev
    merge dev_yr
    merge dev_vu
    merge dev_kp
    commit id: "Update README"
    checkout main
    merge dev
```

4. Робочий процес для лабораторних робіт починаючи з Lab3

Для кожного завдання створюється окрема ізольована гілка (lab-N). Персональні гілки учасників створюються вже від неї, зливаються в lab-N, і тільки після фінальної перевірки потрапляють у dev, а потім у main

```mermaid
gitGraph
    commit id: "Initial commit"
    branch dev
    checkout dev
    commit id: "Lab2"
    commit id: "Lab3"

    branch lab-3
    commit

    branch dev_vu
    branch dev_yr
    branch dev_kp

    checkout dev_vu
    commit

    checkout dev_yr
    commit

    checkout dev_kp
    commit

    checkout lab-3
    merge dev_yr
    merge dev_vu
    merge dev_kp
    commit id: "Update README"

    checkout dev
    merge lab-3

    checkout main
    merge dev
```

<div align="display:flex; gap:10px; align-items:center;">

**Автори**  
- [Уманець Вікторія](https://github.com/cyjiky)
- [Романов Єгор](https://github.com/yeghor)
- [Прокопцов Кірілл](https://github.com/X0nexed)

</div>