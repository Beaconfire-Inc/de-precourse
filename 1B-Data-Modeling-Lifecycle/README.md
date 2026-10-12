# 1B — Data Modeling Lifecycle

This is the second module of the Data Engineering precourse. It follows a data model through its whole **lifecycle**: from requirements, through conceptual, logical, and physical modeling, to maintenance. Along the way it introduces the analytical side of data modeling: OLTP vs OLAP, data warehouses, fact and dimension tables, star and snowflake schemas, and slowly changing dimensions. These are the designs you will build and maintain as a data engineer.

## How to use this folder

This module has a slide deck and two sets of SQL practice:

- **`1B-Data-Modeling-Lifecycle.pdf`**: read this first. It covers the concepts.
- **`1B-Assignment-HackerRank.md`**: then practice, starting here. It's a list of 20 short `SELECT` problems on HackerRank, from the simplest query up to string pattern filters.
- **`1B-Assignment-SQL-Practice.sql`**: finally, 3 harder SQL questions that need `GROUP BY` together with subqueries, CTEs, or window functions.

Like in 1A, the practice is general SQL practice rather than an exercise on the slides.

### Working on the HackerRank list

Sign up for a free HackerRank account, open each problem from the links in the list, and choose **MySQL** in the language dropdown. HackerRank checks your output when you submit.

### Working on the SQL practice file

You need **MySQL 8.0** or newer and a SQL client such as MySQL Workbench, DBeaver, or the `mysql` command line.

1. Open `1B-Assignment-SQL-Practice.sql` and run its **SETUP** section once. It creates the `de_1b` database and fills the `orders` and `employee` tables. It drops and recreates them, so you can re-run it any time to reset the data. It doesn't touch the 1A database.
2. Under each question, replace `-- Your answer here` with your query and run it. Q1.1 asks for two different approaches.
3. Compare your output with the **expected result** shown above the question.

## Folder structure

```
1B-Data-Modeling-Lifecycle/
├── README.md                            <- this file
├── 1B-Data-Modeling-Lifecycle.pdf       Slide deck
├── 1B-Assignment-HackerRank.md          HackerRank list: 20 SELECT problems
└── 1B-Assignment-SQL-Practice.sql       SQL practice: 3 questions with sample data and expected results
```

## Learning path

Work through these in order.

| # | Material | Topics |
|---|---|---|
| 1 | [1B-Data-Modeling-Lifecycle.pdf](1B-Data-Modeling-Lifecycle.pdf) | The six steps: requirement gathering, conceptual modeling, requirement refinement, logical modeling (+ normalization), physical modeling, maintenance and evolution · OLTP vs OLAP · data warehouses · fact and dimension tables · star vs snowflake schema · slowly changing dimensions (Type 0–3) and choosing one · date and junk dimensions |
| 2 | [1B-Assignment-HackerRank.md](1B-Assignment-HackerRank.md) | 20 HackerRank problems · basic `SELECT` and `WHERE` · `DISTINCT` · `COUNT` vs `COUNT(DISTINCT)` · string pattern filters with `LIKE`, `LEFT` / `RIGHT`, and `REGEXP` · sorting by part of a string |
| 3 | [1B-Assignment-SQL-Practice.sql](1B-Assignment-SQL-Practice.sql) | 3 questions on `orders` and `employee` · the top group including ties · top N by total · comparing each row with its group's average (correlated subquery, derived table, or window function) |
