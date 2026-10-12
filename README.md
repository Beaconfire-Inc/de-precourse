# Data Engineering Pre-Course

Pre-course, self-paced data modeling and SQL material for the Data Engineering program, organized by session. Each session folder is written to stand on its own. Every session has a slide deck (PDF) for the concepts, plus practice: runnable SQL files with expected results, HackerRank problem lists, or both. Some sessions also include a commented demo script.

## Prerequisites

- **MySQL 8.0** or newer. Every SQL file in this repo uses MySQL syntax.
- A SQL client to run the scripts. Any one of these works:
  - **MySQL Workbench**
  - **DBeaver**
  - the `mysql` command line
- A free **HackerRank** account for the problem lists in 1B, 1C, and 1D.
- *Optional:* **PostgreSQL 14** or newer, only to run the PostgreSQL comparison demo in 1D.

## How this repo is organized

Every session gets its own top-level folder containing the slide deck, the practice files, and a `README.md` that lists that session's material in learning order. Start with that folder's `README.md`. It has the full topic list, so this root README doesn't repeat it.

| Session | Topic | Folder |
|---|---|---|
| 1A | Data Modeling — the data engineer's role, requirements gathering, keys, cardinality, ER diagrams, normalization (1NF–3NF) | [1A-Data-Modeling/](1A-Data-Modeling/README.md) |
| 1B | Data Modeling Lifecycle — conceptual / logical / physical modeling, OLTP vs OLAP, fact and dimension tables, star vs snowflake schema, slowly changing dimensions | [1B-Data-Modeling-Lifecycle/](1B-Data-Modeling-Lifecycle/README.md) |
| 1C | SQL Part 1 — DDL / DML / DCL / DQL, `GROUP BY`, aggregates, joins, subqueries, CTEs, window functions | [1C-SQL-Part1/](1C-SQL-Part1/README.md) |
| 1D | SQL Part 2 — set operations, indexes, views, stored procedures, triggers, query optimization | [1D-SQL-Part2/](1D-SQL-Part2/README.md) |

Work through the sessions in order, since each one assumes everything from the sessions before it. New sessions will be added to this table in study order.

## Practice files

Each kind of practice file works the same way in every session:

- **`*-Assignment-SQL-Practice.sql`**: run its `SETUP` section once to create the tables and sample data, then write your answer under each question. Every question shows a difficulty level and its **expected result**, so you can check your own work.
- **`*-Assignment-HackerRank.md`**: a list of HackerRank problems with what each one practices, its difficulty, and hints for the tricky ones. HackerRank grades every submission for you.
- **`*-SQL-Demo-*.sql`**: commented demo code that goes with the slides. Each query has an explanation and its expected result, so you can follow along without running anything.

Each script creates its own database (`de_1a`, `de_1b`, `de_1c_demo`, `de_1d_demo`) and drops and recreates its tables, so you can re-run a script any time to reset its data without affecting the others.

The problem lists get harder from session to session. Within the SQL practice files, difficulty is marked as `[*]`, `[**]`, or `[***]`:

- `[*]` One table, filter / sort / single aggregate
- `[**]` `GROUP BY` + `HAVING`, or string / date functions
- `[***]` Needs more than one step: a subquery, a CTE, or a window function

## Getting the code

```bash
git clone git@github.com:Beaconfire-Inc/de-precourse.git
cd de-precourse
```

Then open the folder for your session and follow its `README.md`.

## Got thoughts?

Found a typo, or think an example could be explained better? Want to add a practice question of your own? Open an issue or send a PR. This repo is meant to keep growing with the people learning from it.

## License

- **Code and text** (`*.sql`, `*.md`): [MIT](LICENSE). Use, copy, modify, and share freely, including commercially. Just keep the copyright notice.
- **Slide decks** (`*.pdf`): © 2026 Beaconfire. All rights reserved. Provided for the personal study of program participants. See [LICENSE-SLIDES.md](LICENSE-SLIDES.md).

Questions, or own material used here and want it credited or removed? Open an issue or email [training@beaconfireinc.com](mailto:training@beaconfireinc.com).
