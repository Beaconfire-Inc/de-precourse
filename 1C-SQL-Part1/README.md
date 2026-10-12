# 1C — SQL Part 1

This is the third module of the Data Engineering precourse. It moves from modeling data to **querying it with SQL**: the four kinds of SQL statements (DDL, DML, DCL, DQL), then `SELECT` with filtering, grouping, and aggregates, joins of every kind, subqueries, CTEs, and window functions. Writing, reading, and debugging SQL is the most common day-to-day task of a data engineer.

## How to use this folder

This module has one slide deck, one demo script, and a HackerRank problem list:

- **`1C-SQL-Part1.pdf`**: read this first. It covers the concepts.
- **`1C-SQL-Demo-MySQL.sql`**: then read this alongside the slides. Each query has a short comment explaining what it does, followed by its **expected result**, so you can follow along without running anything.
- **`1C-Assignment-HackerRank.md`**: then practice. It's a list of 17 HackerRank problems on aggregate functions, math functions, `GROUP BY`, and joins, with hints for the tricky ones. Finish the 1B list first.

The demo doesn't cover every example in the slides. DDL / DML / DCL, CTEs, and window functions are covered in the slides only.

### Running the demo (optional)

If you want to run the queries yourself, you need **MySQL 8.0** or newer and a SQL client such as MySQL Workbench, DBeaver, or the `mysql` command line. Run the **SETUP** section first: it creates the `de_1c_demo` database and drops and recreates its tables, so you can re-run it any time to reset the data. Without `ORDER BY`, MySQL may return rows in a different order than shown.

### Working on the HackerRank list

Open each problem from the links in the list and choose **MySQL** in the language dropdown. HackerRank checks your output when you submit.

## Folder structure

```
1C-SQL-Part1/
├── README.md                      <- this file
├── 1C-SQL-Part1.pdf               Slide deck
├── 1C-SQL-Demo-MySQL.sql          Demo: joins, GROUP BY / HAVING, subqueries, with expected results
└── 1C-Assignment-HackerRank.md    HackerRank list: 17 aggregate, math, GROUP BY, and join problems
```

## Learning path

Work through these in order.

| # | Material | Topics |
|---|---|---|
| 1 | [1C-SQL-Part1.pdf](1C-SQL-Part1.pdf) | DDL: creating tables (two methods) · DML, including `MERGE` · DCL · DQL: `SELECT`, `AS`, `WHERE` and conditional operators · `GROUP BY` and aggregate functions · `ORDER BY` · inner, left / right, self, and full outer joins · logical query processing order · subqueries (single-row, multiple-row, correlated, derived tables) · CTEs and recursive CTEs · window functions |
| 2 | [1C-SQL-Demo-MySQL.sql](1C-SQL-Demo-MySQL.sql) | The sample schema: `student`, `enroll`, `faculty`, `rates`, and the coffee tables (`likes`, `serves`, `frequents`) · inner, natural, left, and self joins · comma-join syntax · `GROUP BY` on one and two columns · `HAVING` · subqueries with `IN`, `EXISTS`, and in `FROM` |
| 3 | [1C-Assignment-HackerRank.md](1C-Assignment-HackerRank.md) | 17 HackerRank problems · `COUNT`, `SUM`, `AVG`, `MIN`, `MAX` · `ROUND`, `TRUNCATE`, `FLOOR`, `CEIL` · the value of another column on the row with the max / min · Manhattan and Euclidean distance · `GROUP BY` with formatted output · joining five tables with `COUNT(DISTINCT)` |
