-- =============================================================
-- 1C-SQL-Demo-MySQL.sql   (MySQL 8)
-- =============================================================
-- Demo queries for 1C-SQL-Part1.pdf: joins, GROUP BY / HAVING,
-- and subqueries (IN, EXISTS, subquery in FROM).
-- Run the SETUP section first: the expected results below depend
-- on its data.
-- Without ORDER BY, MySQL may return rows in a different order
-- than shown.
-- =============================================================


-- =============================================================
-- SETUP
-- =============================================================
CREATE DATABASE IF NOT EXISTS de_1c_demo;
USE de_1c_demo;

-- student table
DROP TABLE IF EXISTS student;
CREATE TABLE student (
    NetId   VARCHAR(20),
    Name    VARCHAR(50),
    Major   VARCHAR(50)
);
INSERT INTO student VALUES
('S1', 'Alice', 'CS'),
('S2', 'Bob',   'Math'),
('S3', 'Cathy', 'Physics'),
('S4', 'David', 'CS');

-- enroll table
DROP TABLE IF EXISTS enroll;
CREATE TABLE enroll (
    NetId   VARCHAR(20),
    Course  VARCHAR(50)
);
INSERT INTO enroll VALUES
('S1', 'Database'),
('S2', 'Algebra'),
('S1', 'AI'),
('S3', 'Mechanics');

-- faculty table: MgrNetId points to another faculty member's NetId
DROP TABLE IF EXISTS faculty;
CREATE TABLE faculty (
    NetId    VARCHAR(20),
    Name     VARCHAR(50),
    MgrNetId VARCHAR(20)
);
INSERT INTO faculty VALUES
('F1', 'Prof. Smith',  'F3'),
('F2', 'Prof. Lee',    'F3'),
('F3', 'Dr. Brown',    NULL),
('F4', 'Prof. White',  'F2');

-- rates table: each drinker's score for a coffee
DROP TABLE IF EXISTS rates;
CREATE TABLE rates (
    Drinker VARCHAR(20),
    Coffee  VARCHAR(20),
    Score   INT
);
INSERT INTO rates VALUES
('Alice',  'Latte',    5),
('Bob',    'Latte',    4),
('Cathy',  'Latte',    3),
('Alice',  'Mocha',    4),
('Bob',    'Mocha',    5),
('David',  'Espresso', 2),
('Cathy',  'Espresso', 4);

-- likes / serves / frequents: used by the subquery examples
DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
    drinker VARCHAR(20),
    coffee  VARCHAR(20)
);

DROP TABLE IF EXISTS serves;
CREATE TABLE serves (
    cafe    VARCHAR(20),
    coffee  VARCHAR(20)
);

DROP TABLE IF EXISTS frequents;
CREATE TABLE frequents (
    drinker VARCHAR(20),
    cafe    VARCHAR(20)
);

INSERT INTO likes VALUES
('Alice', 'Cold Brew'),
('Alice', 'Espresso'),
('Bob',   'Espresso'),
('Carol', 'Cold Brew'),
('Dave',  'Latte');

INSERT INTO serves VALUES
('CafeX', 'Cold Brew'),
('CafeX', 'Latte'),
('CafeY', 'Espresso'),
('CafeZ', 'Cold Brew');

INSERT INTO frequents VALUES
('Alice', 'CafeX'),
('Bob',   'CafeY'),
('Carol', 'CafeZ'),
('Dave',  'CafeX');


-- =============================================================
-- Inner Join
-- =============================================================
-- Look at the two tables first: David (S4) has no enrollment.
SELECT * FROM student;
SELECT * FROM enroll;

-- List the students who are enrolled, and their courses.
-- INNER JOIN keeps only rows that match on BOTH sides, so David
-- (not enrolled) is excluded. Alice appears twice, once per course.
--
-- Expected result:
-- +-------+-------+---------+-------+-----------+
-- | NetId | Name  | Major   | NetId | Course    |
-- +-------+-------+---------+-------+-----------+
-- | S1    | Alice | CS      | S1    | Database  |
-- | S1    | Alice | CS      | S1    | AI        |
-- | S2    | Bob   | Math    | S2    | Algebra   |
-- | S3    | Cathy | Physics | S3    | Mechanics |
-- +-------+-------+---------+-------+-----------+
SELECT *
FROM student s
INNER JOIN enroll e ON s.NetId = e.NetId;


-- =============================================================
-- Natural Join
-- =============================================================
-- Joins automatically on every column with the same name (NetId),
-- so no ON condition is needed, and NetId is shown only once.
-- Avoid in Prod: if a same-named column is added to either table
-- later, the join condition silently changes. Write the ON
-- condition explicitly instead.
--
-- Expected result:
-- +-------+-------+---------+-----------+
-- | NetId | Name  | Major   | Course    |
-- +-------+-------+---------+-----------+
-- | S1    | Alice | CS      | Database  |
-- | S1    | Alice | CS      | AI        |
-- | S2    | Bob   | Math    | Algebra   |
-- | S3    | Cathy | Physics | Mechanics |
-- +-------+-------+---------+-----------+
SELECT *
FROM student
NATURAL JOIN enroll;


-- =============================================================
-- Left Join
-- =============================================================
-- Keeps EVERY student, enrolled or not. David has no match in
-- enroll, so the enroll columns are NULL for him.
--
-- Expected result:
-- +-------+-------+---------+-------+-----------+
-- | NetId | Name  | Major   | NetId | Course    |
-- +-------+-------+---------+-------+-----------+
-- | S1    | Alice | CS      | S1    | Database  |
-- | S1    | Alice | CS      | S1    | AI        |
-- | S2    | Bob   | Math    | S2    | Algebra   |
-- | S3    | Cathy | Physics | S3    | Mechanics |
-- | S4    | David | CS      | NULL  | NULL      |
-- +-------+-------+---------+-------+-----------+
SELECT *
FROM student s
LEFT JOIN enroll e ON s.NetId = e.NetId;


-- =============================================================
-- Self Join
-- =============================================================
SELECT * FROM faculty;

-- List each faculty member with their manager's name.
-- The same table is used twice under two aliases: f1 is the
-- employee, f2 is the manager. Dr. Brown has no manager
-- (MgrNetId is NULL), so the inner join drops him.
--
-- Expected result:
-- +-------------+-------------+
-- | FacultyName | ManagerName |
-- +-------------+-------------+
-- | Prof. Smith | Dr. Brown   |
-- | Prof. Lee   | Dr. Brown   |
-- | Prof. White | Prof. Lee   |
-- +-------------+-------------+
SELECT f1.Name AS FacultyName, f2.Name AS ManagerName
FROM faculty f1
JOIN faculty f2 ON f1.MgrNetId = f2.NetId;

-- The same query in the older comma syntax: listing both tables in
-- FROM and putting the join condition in WHERE is equivalent to an
-- inner join. Same expected result as above.
-- Prefer explicit JOIN ... ON: forgetting the WHERE condition here
-- silently turns the query into a cross join (4 x 4 = 16 rows).
SELECT f1.Name AS FacultyName, f2.Name AS ManagerName
FROM faculty f1, faculty f2
WHERE f1.MgrNetId = f2.NetId;


-- =============================================================
-- GROUP BY
-- =============================================================
SELECT * FROM rates;

-- Average score per coffee. AVG() of an INT column returns a
-- DECIMAL with 4 decimal places in MySQL.
--
-- Expected result:
-- +----------+-------------+
-- | Coffee   | AVG(Score)  |
-- +----------+-------------+
-- | Latte    |      4.0000 |
-- | Mocha    |      4.5000 |
-- | Espresso |      3.0000 |
-- +----------+-------------+
SELECT r.Coffee, AVG(r.Score)
FROM rates r
GROUP BY r.Coffee;

-- Grouping by two columns makes one group per (Coffee, Drinker)
-- pair. Every pair appears only once in rates, so each "average"
-- is just that single score: 7 groups for 7 rows.
--
-- Expected result:
-- +----------+---------+-------------+
-- | Coffee   | Drinker | AVG(Score)  |
-- +----------+---------+-------------+
-- | Latte    | Alice   |      5.0000 |
-- | Latte    | Bob     |      4.0000 |
-- | Latte    | Cathy   |      3.0000 |
-- | Mocha    | Alice   |      4.0000 |
-- | Mocha    | Bob     |      5.0000 |
-- | Espresso | David   |      2.0000 |
-- | Espresso | Cathy   |      4.0000 |
-- +----------+---------+-------------+
SELECT r.Coffee, r.Drinker, AVG(r.Score)
FROM rates r
GROUP BY r.Coffee, r.Drinker;


-- =============================================================
-- GROUP BY with HAVING
-- =============================================================
-- Average score of coffees rated at least 3 times.
-- WHERE filters rows before grouping; HAVING filters groups after
-- grouping, so it can use aggregates like COUNT(). Only Latte has
-- 3 ratings. ORDER BY ... LIMIT 1 then keeps the first group in
-- reverse alphabetical order (here the only one).
--
-- Expected result:
-- +--------+------------+
-- | Coffee | AVG_RATING |
-- +--------+------------+
-- | Latte  |     4.0000 |
-- +--------+------------+
SELECT r.Coffee, AVG(r.Score) AS AVG_RATING
FROM rates r
GROUP BY r.Coffee
HAVING COUNT(r.Score) >= 3
ORDER BY r.Coffee DESC
LIMIT 1;


-- =============================================================
-- Subquery with IN
-- =============================================================
SELECT * FROM likes;

-- Who likes both 'Cold Brew' and 'Espresso'?
-- The inner query returns everyone who likes Espresso (Alice, Bob);
-- the outer query keeps the Cold Brew fans in that list.
--
-- Expected result:
-- +---------+
-- | drinker |
-- +---------+
-- | Alice   |
-- +---------+
SELECT l.drinker
FROM likes l
WHERE l.coffee = 'Cold Brew'
  AND l.drinker IN (
      SELECT l2.drinker
      FROM likes l2
      WHERE l2.coffee = 'Espresso'
  );

-- The same question as a self join: l1 is the Cold Brew row, l2 is
-- the Espresso row of the same drinker. Same expected result.
SELECT l1.drinker
FROM likes l1
JOIN likes l2 ON l1.drinker = l2.drinker
WHERE l1.coffee = 'Cold Brew'
  AND l2.coffee = 'Espresso';


-- =============================================================
-- Subquery with EXISTS (correlated)
-- =============================================================
SELECT * FROM frequents;
SELECT * FROM serves;

-- Who goes to a cafe that serves 'Cold Brew'?
-- The inner query refers to f.cafe from the outer query, so it is
-- re-evaluated for each frequents row. EXISTS is true as soon as
-- one matching row is found; the SELECT list inside does not
-- matter. CafeX and CafeZ serve Cold Brew.
--
-- Expected result:
-- +---------+
-- | drinker |
-- +---------+
-- | Alice   |
-- | Carol   |
-- | Dave    |
-- +---------+
SELECT DISTINCT f.drinker
FROM frequents f
WHERE EXISTS (
    SELECT s.cafe
    FROM serves s
    WHERE s.coffee = 'Cold Brew'
      AND f.cafe = s.cafe
);


-- =============================================================
-- Subquery in the FROM clause (derived table)
-- =============================================================
-- The same question: first build a temporary table s2 of cafes that
-- serve Cold Brew, then join frequents to it. A derived table must
-- have an alias (s2). Same expected result as the EXISTS version.
SELECT DISTINCT f.drinker
FROM frequents f,
     (SELECT s.cafe
      FROM serves s
      WHERE s.coffee = 'Cold Brew') s2
WHERE f.cafe = s2.cafe;
