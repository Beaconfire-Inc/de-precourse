# 1B Assignment: HackerRank SQL Practice

20 short SELECT problems on HackerRank, from the simplest query up to string pattern filters. Do these before [1B-Assignment-SQL-Practice.sql](1B-Assignment-SQL-Practice.sql), which is harder.

## How to work on them

- Sign up for a free HackerRank account to submit answers.
- In each problem's language dropdown, choose **MySQL**.
- HackerRank checks your output when you submit. You get the result right away, so no answer key is needed.

Difficulty uses the same scale as the SQL practice files:

- `[*]` One table, filter / sort / single aggregate
- `[**]` String functions or pattern matching
- `[***]` Needs more than one step: a subquery, `UNION`, or a CTE

## Basic SELECT

| # | Problem | What it practices | Difficulty |
|---|---|---|---|
| 1 | [Revising the Select Query I](https://www.hackerrank.com/challenges/revising-the-select-query/problem) | `WHERE` with two conditions | `[*]` |
| 2 | [Revising the Select Query II](https://www.hackerrank.com/challenges/revising-the-select-query-2/problem) | Selecting one column with a filter | `[*]` |
| 3 | [Select All](https://www.hackerrank.com/challenges/select-all-sql/problem) | `SELECT *` | `[*]` |
| 4 | [Select By ID](https://www.hackerrank.com/challenges/select-by-id/problem) | Filtering on the primary key | `[*]` |
| 5 | [Japanese Cities' Attributes](https://www.hackerrank.com/challenges/japanese-cities-attributes/problem) | Filtering on a text column | `[*]` |
| 6 | [Japanese Cities' Names](https://www.hackerrank.com/challenges/japanese-cities-name/problem) | Filtering on a text column | `[*]` |
| 7 | [Weather Observation Station 1](https://www.hackerrank.com/challenges/weather-observation-station-1/problem) | Selecting several columns | `[*]` |
| 8 | [Weather Observation Station 3](https://www.hackerrank.com/challenges/weather-observation-station-3/problem) | `DISTINCT`, even IDs with `MOD()` | `[*]` |
| 9 | [Weather Observation Station 4](https://www.hackerrank.com/challenges/weather-observation-station-4/problem) | `COUNT(*)` vs `COUNT(DISTINCT ...)` | `[*]` |
| 10 | [Weather Observation Station 5](https://www.hackerrank.com/challenges/weather-observation-station-5/problem) | Shortest and longest name, with ties broken alphabetically | `[***]` |

Problems 9 and 10 are similar to Q1.3 and Q1.4 in the 1A practice file. Watch for one difference in problem 10: HackerRank wants exactly one row for the shortest name and one for the longest, not every tie.

## String pattern filters

| # | Problem | What it practices | Difficulty |
|---|---|---|---|
| 11 | [Weather Observation Station 6](https://www.hackerrank.com/challenges/weather-observation-station-6/problem) | Names **starting** with a vowel | `[**]` |
| 12 | [Weather Observation Station 7](https://www.hackerrank.com/challenges/weather-observation-station-7/problem) | Names **ending** with a vowel | `[**]` |
| 13 | [Weather Observation Station 8](https://www.hackerrank.com/challenges/weather-observation-station-8/problem) | Starting **and** ending with a vowel | `[**]` |
| 14 | [Weather Observation Station 9](https://www.hackerrank.com/challenges/weather-observation-station-9/problem) | **Not** starting with a vowel | `[**]` |
| 15 | [Weather Observation Station 10](https://www.hackerrank.com/challenges/weather-observation-station-10/problem) | **Not** ending with a vowel | `[**]` |
| 16 | [Weather Observation Station 11](https://www.hackerrank.com/challenges/weather-observation-station-11/problem) | Not starting **or** not ending with a vowel | `[**]` |
| 17 | [Weather Observation Station 12](https://www.hackerrank.com/challenges/weather-observation-station-12/problem) | Not starting **and** not ending with a vowel | `[**]` |

Try problems 11–17 in two ways: once with `LIKE` / `LEFT()` / `RIGHT()`, and once with `REGEXP`. Problems 16 and 17 are a good check that you apply De Morgan's laws correctly.

## Sorting and filtering employees

| # | Problem | What it practices | Difficulty |
|---|---|---|---|
| 18 | [Higher Than 75 Marks](https://www.hackerrank.com/challenges/more-than-75-marks/problem) | Sorting by the last 3 characters, then by ID | `[**]` |
| 19 | [Employee Names](https://www.hackerrank.com/challenges/name-of-employees/problem) | `ORDER BY` a text column | `[*]` |
| 20 | [Employee Salaries](https://www.hackerrank.com/challenges/salary-of-employees/problem) | Two conditions, sorted by ID | `[*]` |
