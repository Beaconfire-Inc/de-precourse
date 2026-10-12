# 1A — Data Modeling

This is the first module of the Data Engineering precourse. It starts with what a data engineer actually does day to day, then covers **relational data modeling**: gathering requirements from the business, describing data with keys, relationships, and ER diagrams, and normalizing tables so the data stays consistent. Every pipeline a data engineer builds reads from or writes to a data model, so this is the foundation for everything after it.

## How to use this folder

This module has one slide deck and one SQL practice file:

- **`1A-Data-Modeling.pdf`**: read this first. It covers the concepts.
- **`1A-Assignment-SQL-Practice.sql`**: then practice. This is a set of 12 SQL coding questions on three sample tables, for you to work through at your own pace.

The practice file is general SQL practice, not an exercise on the slides: it uses `SELECT`, `WHERE`, `LIKE`, aggregate functions, and `GROUP BY` / `HAVING`. If those are new to you, skim pages 14–23 of the 1C slide deck ([1C-SQL-Part1.pdf](../1C-SQL-Part1/1C-SQL-Part1.pdf)) first.

### Working on the practice file

You need **MySQL 8.0** or newer and a SQL client such as MySQL Workbench, DBeaver, or the `mysql` command line.

1. Open `1A-Assignment-SQL-Practice.sql` and run its **SETUP** section once. It creates the `de_1a` database and fills the `employee`, `order_history`, and `movie_rental` tables. It drops and recreates them, so you can re-run it any time to reset the data.
2. Under each question, replace `-- Your answer here` with your query and run it.
3. Compare your output with the **expected result** shown above the question. Your column names don't have to match, but the values and the row order should.

Each question is marked `[*]`, `[**]`, or `[***]` by difficulty. The sample data includes a few edge cases on purpose (values right on a boundary, ties, duplicates), so a query that looks right but handles them wrong will give a visibly different result.

## Folder structure

```
1A-Data-Modeling/
├── README.md                        <- this file
├── 1A-Data-Modeling.pdf             Slide deck
└── 1A-Assignment-SQL-Practice.sql   SQL practice: 12 questions with sample data and expected results
```

## Learning path

Work through these in order.

| # | Material | Topics |
|---|---|---|
| 1 | [1A-Data-Modeling.pdf](1A-Data-Modeling.pdf) | What data engineers do · required skills and day-to-day tasks · requirements gathering (JAD meetings, BRD, FRD) · relational model terminology · keys · cardinality and degree · ER diagrams (Chen, Crow's Foot) · converting an ERD to tables · normalization (redundancy, update / insertion / deletion anomalies, functional dependencies, 1NF–3NF) · database integrity |
| 2 | [1A-Assignment-SQL-Practice.sql](1A-Assignment-SQL-Practice.sql) | 12 questions on `employee`, `order_history`, and `movie_rental` · filtering with `WHERE` and `LIKE` · `MAX`, `SUM`, `COUNT`, `COUNT(DISTINCT)` · string and date functions · `GROUP BY` / `HAVING` · handling ties and duplicates |
