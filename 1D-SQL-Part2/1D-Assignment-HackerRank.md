# 1D Assignment: HackerRank SQL Practice

16 HackerRank problems on joins, `CASE`, subqueries and CTEs, pivoting, and window functions. These are the hardest of the precourse lists: most need two or more steps. Finish the 1B and 1C lists first.

## How to work on them

- Sign up for a free HackerRank account to submit answers.
- In each problem's language dropdown, choose **MySQL** (one exception: see the hint for #15).
- HackerRank checks your output when you submit. You get the result right away, so no answer key is needed.
- For the multi-step problems, try writing each step as a CTE (`WITH step1 AS (...), step2 AS (...)`). It is easier to read and to debug one step at a time.

Difficulty uses the same scale as the SQL practice files:

- `[*]` One join plus a filter or a single aggregate
- `[**]` Join or `CASE` with `GROUP BY`, or a join on a range
- `[***]` Needs more than one step: nested aggregates, subqueries, CTEs, or window functions

## Joins

| # | Problem | What it practices | Difficulty |
|---|---|---|---|
| 1 | [Asian Population](https://www.hackerrank.com/challenges/asian-population/problem) | Inner join + `SUM()` | `[*]` |
| 2 | [African Cities](https://www.hackerrank.com/challenges/african-cities/problem) | Inner join + filter | `[*]` |
| 3 | [Average Population of Each Continent](https://www.hackerrank.com/challenges/average-population-of-each-continent/problem) | Join + `GROUP BY` + `FLOOR(AVG())` | `[**]` |
| 4 | [The Report](https://www.hackerrank.com/challenges/the-report/problem) | Join on a range, `CASE` in the output | `[**]` |
| 5 | [Top Competitors](https://www.hackerrank.com/challenges/full-score/problem) | Four-table join, `GROUP BY` + `HAVING` | `[***]` |

Hints:

- **#4 The Report**: there is no shared key between `Students` and `Grades`. Join on a range instead: `ON s.marks BETWEEN g.min_mark AND g.max_mark`.
- **#5 Top Competitors**: a "full score" means the submission's score equals the challenge's difficulty's score. Join to `Difficulty` through `Challenges` to compare them.

## CASE expressions

| # | Problem | What it practices | Difficulty |
|---|---|---|---|
| 6 | [Type of Triangle](https://www.hackerrank.com/challenges/what-type-of-triangle/problem) | `CASE` with several conditions | `[**]` |
| 7 | [Binary Tree Nodes](https://www.hackerrank.com/challenges/binary-search-tree-1/problem) | `CASE` + subquery: root, inner, or leaf node | `[**]` |

Hints:

- **#6**: `CASE` returns the first `WHEN` that is true, so order matters. Check "Not A Triangle" first.
- **#7**: a node is a leaf when no other row has it as its parent. `IN` / `NOT IN` against the `P` column is enough, but watch out for the `NULL` parent of the root when you use `NOT IN`.

## Subqueries and CTEs

| # | Problem | What it practices | Difficulty |
|---|---|---|---|
| 8 | [Top Earners](https://www.hackerrank.com/challenges/earnings-of-employees/problem) | Computed column + `MAX()` + `COUNT()` | `[**]` |
| 9 | [Contest Leaderboard](https://www.hackerrank.com/challenges/contest-leaderboard/problem) | Aggregate of an aggregate (max per challenge, then sum) | `[***]` |
| 10 | [Challenges](https://www.hackerrank.com/challenges/challenges/problem) | Filtering groups by how their counts compare with other groups | `[***]` |
| 11 | [Ollivander's Inventory](https://www.hackerrank.com/challenges/harry-potter-and-wands/problem) | Cheapest wand per (age, power), correlated subquery | `[***]` |
| 12 | [Placements](https://www.hackerrank.com/challenges/placements/problem) | Joining the same table twice under two aliases | `[***]` |
| 13 | [Symmetric Pairs](https://www.hackerrank.com/challenges/symmetric-pairs/problem) | Self join, special case for `X = Y` | `[***]` |
| 14 | [SQL Project Planning](https://www.hackerrank.com/challenges/sql-projects/problem) | Grouping consecutive dates ("gaps and islands") | `[***]` |

Hints:

- **#9**: first take each hacker's best score per challenge, then sum those. Leave out hackers whose total is 0.
- **#10**: keep a count if it is the maximum count, **or** if no other student has the same count. Compute the counts once in a CTE, then filter it twice.
- **#12**: you need the salary of the student **and** of their best friend, so join `Packages` twice.
- **#13**: a pair with `X = Y` is symmetric with itself only if it appears at least twice. Handle it separately, then `UNION` with the `X < Y` case.
- **#14**: number the tasks in order of `start_date`. If dates in a run are consecutive, then `start_date` minus that many days is the same for every row in the run. Group by that value. In MySQL, subtract days with `DATE_SUB(start_date, INTERVAL n DAY)`, not with a plain `-`.

## Pivoting

| # | Problem | What it practices | Difficulty |
|---|---|---|---|
| 15 | [Occupations](https://www.hackerrank.com/challenges/occupations/problem) | Turning rows into columns | `[***]` |

Hints:

- **#15**: MySQL has no `PIVOT` keyword. Number the names within each occupation with `ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name)`, then `GROUP BY` that number and pick each column with `MAX(CASE WHEN occupation = 'Doctor' THEN name END)`.
- If you want to try the `PIVOT` keyword itself, switch the language to **MS SQL Server** for this one problem.

## Window functions

| # | Problem | What it practices | Difficulty |
|---|---|---|---|
| 16 | [Weather Observation Station 20](https://www.hackerrank.com/challenges/weather-observation-station-20/problem) | Median with `ROW_NUMBER()` and `COUNT() OVER ()` | `[***]` |

Hints:

- **#16**: number the rows in order of `LAT_N` and count the total. The median is the middle row when the count is odd, or the average of the two middle rows when it is even. Try to write one query that handles both cases.
