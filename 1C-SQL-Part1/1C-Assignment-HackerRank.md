# 1C Assignment: HackerRank SQL Practice

17 HackerRank problems on aggregate functions, math functions, `GROUP BY`, and joins. They build on the 1B HackerRank list, so finish that one first.

## How to work on them

- Sign up for a free HackerRank account to submit answers.
- In each problem's language dropdown, choose **MySQL**.
- HackerRank checks your output when you submit. You get the result right away, so no answer key is needed.

Difficulty uses the same scale as the SQL practice files:

- `[*]` One table, filter / sort / single aggregate
- `[**]` String or math functions, or picking a value from the row with the max / min
- `[***]` Needs more than one step: `GROUP BY` with formatted output, or joins across several tables

## Aggregate functions

| # | Problem | What it practices | Difficulty |
|---|---|---|---|
| 1 | [Revising Aggregations - The Count Function](https://www.hackerrank.com/challenges/revising-aggregations-the-count-function/problem) | `COUNT()` with a filter | `[*]` |
| 2 | [Revising Aggregations - The Sum Function](https://www.hackerrank.com/challenges/revising-aggregations-sum/problem) | `SUM()` with a filter | `[*]` |
| 3 | [Revising Aggregations - Averages](https://www.hackerrank.com/challenges/revising-aggregations-the-average-function/problem) | `AVG()` with a filter | `[*]` |
| 4 | [Average Population](https://www.hackerrank.com/challenges/average-population/problem) | `AVG()` rounded down | `[*]` |
| 5 | [Japan Population](https://www.hackerrank.com/challenges/japan-population/problem) | `SUM()` with a filter | `[*]` |
| 6 | [Population Density Difference](https://www.hackerrank.com/challenges/population-density-difference/problem) | `MAX() - MIN()` | `[*]` |
| 7 | [The Blunder](https://www.hackerrank.com/challenges/the-blunder/problem) | Doing math on a "broken" value | `[**]` |
| 8 | [Weather Observation Station 2](https://www.hackerrank.com/challenges/weather-observation-station-2/problem) | `SUM()` and `ROUND()` | `[*]` |
| 9 | [Weather Observation Station 13](https://www.hackerrank.com/challenges/weather-observation-station-13/problem) | `SUM()` over a range, `TRUNCATE()` | `[*]` |
| 10 | [Weather Observation Station 14](https://www.hackerrank.com/challenges/weather-observation-station-14/problem) | `MAX()` below a limit | `[*]` |
| 11 | [Weather Observation Station 15](https://www.hackerrank.com/challenges/weather-observation-station-15/problem) | Another column's value on the row with the max | `[**]` |
| 12 | [Weather Observation Station 16](https://www.hackerrank.com/challenges/weather-observation-station-16/problem) | `MIN()` above a limit | `[*]` |
| 13 | [Weather Observation Station 17](https://www.hackerrank.com/challenges/weather-observation-station-17/problem) | Another column's value on the row with the min | `[**]` |

Hints:

- **#7 The Blunder** is a bit tricky. The "miscalculated" average comes from salaries with every `0` removed. Look at `REPLACE()` to build that wrong value, and `CEIL()` to round the difference up.
- **#9** is a plain `SUM()` with a range condition. Make sure you truncate, not round.
- **#11 and #13** can't be solved with `MAX()` / `MIN()` alone, because you need a different column from that row. `ORDER BY ... LIMIT 1` is the simplest way. Can you also write it with a subquery?

## Math functions, GROUP BY, and joins

| # | Problem | What it practices | Difficulty |
|---|---|---|---|
| 14 | [Weather Observation Station 18](https://www.hackerrank.com/challenges/weather-observation-station-18/problem) | Manhattan distance: `MIN()`, `MAX()`, `ABS()` | `[**]` |
| 15 | [Weather Observation Station 19](https://www.hackerrank.com/challenges/weather-observation-station-19/problem) | Euclidean distance: `SQRT()`, `POWER()` | `[**]` |
| 16 | [The PADS](https://www.hackerrank.com/challenges/the-pads/problem) | `CONCAT()`, `GROUP BY` + `COUNT()`, two result sets | `[***]` |
| 17 | [New Companies](https://www.hackerrank.com/challenges/the-company/problem) | Joining five tables, `COUNT(DISTINCT ...)` | `[***]` |

Hints:

- **#16 The PADS** asks for two separate queries. Submit both in the same answer box.
- **#17 New Companies**: don't overcomplicate this one. The tables contain duplicate rows, so `COUNT(DISTINCT ...)` matters more than the join logic. Also note that `company_code` is a string, so `C_10` sorts before `C_2`.
