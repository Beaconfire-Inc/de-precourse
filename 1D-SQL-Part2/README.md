# 1D — SQL Part 2

This is the fourth module of the Data Engineering precourse. It goes beyond writing single queries to the database features a data engineer works with: **set operations, indexes, views and materialized views, stored procedures, dynamic SQL, and triggers**, and how to read execution plans and optimize slow queries. These come up whenever you automate logic inside the database or make a pipeline run faster.

## How to use this folder

This module has one slide deck, a demo in two SQL dialects, and a HackerRank problem list:

- **`1D-SQL-Part2.pdf`**: read this first. It covers the concepts.
- **`1D-SQL-Demo-MySQL.sql`**: then read this alongside the "Stored Procedures and Triggers" part of the slides. Each step has a short comment explaining what it does, followed by its **expected result**, so you can follow along without running anything.
- **`1D-SQL-Demo-PostgreSQL.sql`** *(optional)*: the same demo written for PostgreSQL. Its header lists the main syntax differences from MySQL, and each section points out how MySQL does the same thing. Read it if you want to see how much procedure and trigger syntax varies between databases.
- **`1D-Assignment-HackerRank.md`**: then practice. It's a list of 16 HackerRank problems on joins, `CASE`, subqueries and CTEs, pivoting, and window functions. These are the hardest problems in the precourse, so finish the 1B and 1C lists first.

The demos cover stored procedures and triggers only. Set operations, indexes, views, dynamic SQL, and query optimization are covered in the slides only.

### Running the demos (optional)

- **MySQL**: you need **MySQL 8.0** or newer and a SQL client such as MySQL Workbench, DBeaver, or the `mysql` command line. Run `1D-SQL-Demo-MySQL.sql` from top to bottom. It creates the `de_1d_demo` database and can be re-run safely. The `DELIMITER` lines are client commands: they work in MySQL Workbench and the `mysql` command line, and some other tools don't need them.
- **PostgreSQL**: you need **PostgreSQL 14** or newer and a client such as psql, pgAdmin, or DBeaver. Run `1D-SQL-Demo-PostgreSQL.sql` from top to bottom in any database. It can be re-run safely.

### Working on the HackerRank list

Open each problem from the links in the list and choose **MySQL** in the language dropdown (the list mentions the one exception). HackerRank checks your output when you submit. For the multi-step problems, write each step as a CTE so you can check one step at a time.

## Folder structure

```
1D-SQL-Part2/
├── README.md                       <- this file
├── 1D-SQL-Part2.pdf                Slide deck
├── 1D-SQL-Demo-MySQL.sql           Demo: stored procedures and a trigger (MySQL), with expected results
├── 1D-SQL-Demo-PostgreSQL.sql      The same demo for PostgreSQL, for comparison
└── 1D-Assignment-HackerRank.md     HackerRank list: 16 join, CASE, subquery / CTE, pivot, and window function problems
```

## Learning path

Work through these in order.

| # | Material | Topics |
|---|---|---|
| 1 | [1D-SQL-Part2.pdf](1D-SQL-Part2.pdf) | Set operations: `UNION`, `INTERSECT`, `EXCEPT` · indexes: clustered vs non-clustered, choosing an index · views and materialized views · stored procedures · dynamic SQL · triggers: insert, update / delete, `FOR EACH ROW` vs `FOR EACH STATEMENT` · query optimization and execution plans (SQL Server, Snowflake) |
| 2 | [1D-SQL-Demo-MySQL.sql](1D-SQL-Demo-MySQL.sql) | `DELIMITER` · a stored procedure with IN / OUT parameters (`AverageScore`) · session variables · a procedure that returns a result set (`ShowAccounts`) · an `AFTER INSERT` trigger that writes to a log table · `NEW` |
| 3 | [1D-SQL-Demo-PostgreSQL.sql](1D-SQL-Demo-PostgreSQL.sql) | The same demo in PostgreSQL · `IDENTITY` columns · dollar-quoted bodies and `LANGUAGE plpgsql` · OUT parameters returned as a row · trigger functions and `EXECUTE FUNCTION` · `RETURNS TABLE` functions |
| 4 | [1D-Assignment-HackerRank.md](1D-Assignment-HackerRank.md) | 16 HackerRank problems · joins, including a join on a range · `CASE` · nested aggregates · correlated subqueries · self joins · gaps and islands · pivoting rows into columns without `PIVOT` · median with window functions |
