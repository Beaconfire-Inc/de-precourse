-- =============================================================
-- 1B-Assignment-SQL-Practice.sql   (MySQL 8)
-- =============================================================
-- Self-paced SQL coding practice: 3 questions on 2 tables.
-- These are harder than 1A: you will need GROUP BY together with
-- subqueries, CTEs, or window functions. Do the HackerRank list
-- (1B-Assignment-HackerRank.md) first if you want a warm-up.
--
-- How to use this file:
--   1. Run the SETUP section once. It creates the database
--      `de_1b` and fills the two tables with sample data.
--   2. Under each question, replace "-- Your answer here" with
--      your query, run it, and compare your output with the
--      expected result shown above it.
--
-- Rules:
--   - Write your own answers. You may discuss the questions with
--     others, but write your own code.
--   - Try to find more than one way to answer a question.
--   - Follow best practice so your code is readable, maintainable,
--     and efficient.
--   - State any assumption you make in a comment above your query.
--
-- Difficulty:
--   [*]    One table, filter / sort / single aggregate
--   [**]   GROUP BY + HAVING, or string / date functions
--   [***]  Needs more than one step: a subquery, a CTE, or
--          a window function
--
-- Your column names do not have to match the expected results, but
-- the values and the row order should.
-- =============================================================


-- =============================================================
-- SETUP: run this section once
-- =============================================================
CREATE DATABASE IF NOT EXISTS de_1b;
USE de_1b;

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id     INT PRIMARY KEY,
    customer_id  INT,
    order_date   DATE,
    amount       INT
);

INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(1,  101, '2023-01-05', 120),
(2,  102, '2023-01-07', 300),
(3,  103, '2023-01-12', 900),
(4,  104, '2023-01-15',  50),
(5,  101, '2023-01-20',  80),
(6,  104, '2023-02-01',  70),
(7,  105, '2023-02-05', 500),
(8,  102, '2023-02-10', 250),
(9,  101, '2023-02-14', 150),
(10, 104, '2023-02-20',  40),
(11, 101, '2023-03-02',  60),
(12, 104, '2023-03-10',  90),
(13, 102, '2023-03-15', 200),
(14, 105, '2023-03-20', 100),
(15, 106, '2023-03-25',  30);

DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
    emp_id         INT PRIMARY KEY,
    department_id  INT,
    salary         INT
);

INSERT INTO employee (emp_id, department_id, salary) VALUES
(1, 10,  5000),
(2, 10,  7000),
(3, 10,  6000),
(4, 20,  9000),
(5, 20, 12000),
(6, 20, 10000),
(7, 20, 13000),
(8, 30,  8000);


-- =============================================================
-- Q1: ORDERS
-- =============================================================
--   Field        Type
--   -----------  ----
--   ORDER_ID     int
--   CUSTOMER_ID  int
--   ORDER_DATE   date
--   AMOUNT       int

-- -------------------------------------------------------------
-- Q1.1 [***]
-- Find the customer(s) who placed the highest number of orders,
-- with their order count.
--   - If several customers tie for the highest count, list all of
--     them, ordered by customer_id.
--   - Write it in two different ways (for example, one with a
--     subquery and one with a window function).
--
-- Expected result:
-- +-------------+-------------+
-- | customer_id | order_count |
-- +-------------+-------------+
-- |         101 |           4 |
-- |         104 |           4 |
-- +-------------+-------------+

-- Your answer here (approach 1)


-- Your answer here (approach 2)


-- -------------------------------------------------------------
-- Q1.2 [**]
-- Find the top 3 customers by total order amount, with their
-- total, from highest to lowest.
-- (The sample data has no tie for 3rd place.)
--
-- Expected result:
-- +-------------+--------------+
-- | customer_id | total_amount |
-- +-------------+--------------+
-- |         103 |          900 |
-- |         102 |          750 |
-- |         105 |          600 |
-- +-------------+--------------+

-- Your answer here


-- =============================================================
-- Q2: EMPLOYEE
-- =============================================================
--   Field          Type
--   -------------  ----
--   EMP_ID         int
--   DEPARTMENT_ID  int
--   SALARY         int

-- -------------------------------------------------------------
-- Q2.1 [***]
-- Find the employees who earn more than the average salary of
-- their own department. Show emp_id, department_id, and salary,
-- ordered by emp_id.
--
-- Expected result:
-- +--------+---------------+--------+
-- | emp_id | department_id | salary |
-- +--------+---------------+--------+
-- |      2 |            10 |   7000 |
-- |      5 |            20 |  12000 |
-- |      7 |            20 |  13000 |
-- +--------+---------------+--------+

-- Your answer here
