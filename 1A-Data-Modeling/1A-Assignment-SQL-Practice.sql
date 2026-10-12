-- =============================================================
-- 1A-Assignment-SQL-Practice.sql   (MySQL 8)
-- =============================================================
-- Self-paced SQL coding practice: 12 questions on 3 tables.
--
-- How to use this file:
--   1. Run the SETUP section once. It creates the database
--      `de_1a` and fills the three tables with sample data.
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
--          grouping on more than one column
--
-- Your column names do not have to match the expected results, but
-- the values and the row order should.
-- =============================================================


-- =============================================================
-- SETUP: run this section once
-- =============================================================
CREATE DATABASE IF NOT EXISTS de_1a;
USE de_1a;

DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
    emp_id      INT PRIMARY KEY,
    name        VARCHAR(50),
    department  VARCHAR(50),
    salary      DECIMAL(10,2),
    hire_date   DATE
);

INSERT INTO employee (emp_id, name, department, salary, hire_date) VALUES
(1,  'Amy',         'Sales',       72000.00, '2016-03-14'),
(2,  'Christopher', 'Engineering', 125000.00, '2015-07-01'),
(3,  'Allison',     'Marketing',   68000.00, '2019-02-11'),
(4,  'Jackson',     'Engineering', 98000.00, '2017-12-31'),
(5,  'Zoey',        'Finance',     81000.00, '2020-05-20'),
(6,  'Bartholomew', 'Sales',       64000.00, '2018-06-04'),
(7,  'Albert',      'Finance',     90000.00, '2014-09-15'),
(8,  'Sonia',       'Marketing',   71000.00, '2017-04-22'),
(9,  'Mason',       'Engineering', 105000.00, '2019-08-30'),
(10, 'Ian',         'Sales',       59000.00, '2021-01-11'),
(11, 'Emerson',     'Engineering', 132000.00, '2018-01-01'),
(12, 'Natalie',     'Finance',     77000.00, '2016-11-03');

-- AMOUNT is the total value of the order (it already accounts
-- for QUANTITY). Do not multiply them.
DROP TABLE IF EXISTS order_history;
CREATE TABLE order_history (
    order_id       INT PRIMARY KEY,
    customer_name  VARCHAR(50),
    product        VARCHAR(50),
    order_date     DATE,
    amount         DECIMAL(10,2),
    quantity       INT
);

INSERT INTO order_history (order_id, customer_name, product, order_date, amount, quantity) VALUES
(1,  'Alice', 'Laptop',     '2021-03-01', 1200.00,  1),
(2,  'Bob',   'Mouse',      '2021-03-01',  250.00, 50),
(3,  'Carol', 'Keyboard',   '2021-03-05',  300.00, 30),
(4,  'Carol', 'Keyboard',   '2021-03-05',  250.00, 25),
(5,  'David', 'Monitor',    '2021-03-12',  500.00,  2),
(6,  'Alice', 'Monitor',    '2021-03-31',  750.00,  3),
(7,  'Eve',   'Headphones', '2021-02-28',  450.00, 45),
(8,  'Frank', 'Laptop',     '2021-04-01', 2400.00,  2),
(9,  'Bob',   'Mouse',      '2021-04-15',  260.00, 52),
(10, 'Grace', 'Headphones', '2020-03-15',  900.00,  9),
(11, 'Eve',   'Headphones', '2021-03-20',  200.00, 20),
(12, 'Henry', 'Laptop',     '2021-03-20',  750.00,  1),
(13, 'David', 'Keyboard',   '2021-05-02',  120.00, 12);

-- PRICE is the total amount paid for that rental (it already
-- accounts for DAYS_RENTED). Do not multiply them.
DROP TABLE IF EXISTS movie_rental;
CREATE TABLE movie_rental (
    rental_id    INT PRIMARY KEY,
    movie_title  VARCHAR(100),
    genre        VARCHAR(50),
    rental_date  DATE,
    price        DECIMAL(8,2),
    days_rented  INT
);

INSERT INTO movie_rental (rental_id, movie_title, genre, rental_date, price, days_rented) VALUES
(1,  'Star Wars',    'Sci-Fi',    '2022-01-15', 120.00,  3),
(2,  'Mad Max',      'Action',    '2022-01-15', 150.00,  8),
(3,  'Lone STAR',    'Western',   '2022-01-15',  80.00,  2),
(4,  'Die Hard',     'Action',    '2022-02-10', 200.00,  7),
(5,  'Superstar',    'Comedy',    '2022-02-10', 100.00, 10),
(6,  'Stardust',     'Fantasy',   '2021-12-30',  90.00,  4),
(7,  'Mad Max',      'Action',    '2022-03-05', 180.00,  9),
(8,  'Notting Hill', 'Romance',   '2022-03-05',  60.00,  1),
(9,  'Inception',    'Sci-Fi',    '2022-03-05', 140.00, 12),
(10, 'Star Wars',    'Sci-Fi',    '2023-01-02', 130.00,  5),
(11, 'John Wick',    'Action',    '2022-04-18', 400.00, 14),
(12, 'Toy Story',    'Animation', '2022-04-19',  50.00,  7);


-- =============================================================
-- Q1: EMPLOYEE
-- =============================================================
--   Field       Type
--   ----------  -------------
--   EMP_ID      int
--   NAME        varchar
--   DEPARTMENT  varchar
--   SALARY      decimal(10,2)
--   HIRE_DATE   date

-- -------------------------------------------------------------
-- Q1.1 [*]
-- Query the highest salary among employees hired before
-- 2018-01-01 (an employee hired on 2018-01-01 does not count).
--
-- Expected result:
-- +-------------+
-- | max_salary  |
-- +-------------+
-- |   125000.00 |
-- +-------------+

-- Your answer here


-- -------------------------------------------------------------
-- Q1.2 [*]
-- Query the names of employees whose name ends with "son" or
-- starts with "Al", in alphabetical order.
--
-- Expected result:
-- +---------+
-- | name    |
-- +---------+
-- | Albert  |
-- | Allison |
-- | Emerson |
-- | Jackson |
-- | Mason   |
-- +---------+

-- Your answer here


-- -------------------------------------------------------------
-- Q1.3 [*]
-- Query the difference between the total number of employees and
-- the number of distinct departments.
--
-- Expected result:
-- +------------+
-- | difference |
-- +------------+
-- |          8 |
-- +------------+

-- Your answer here


-- -------------------------------------------------------------
-- Q1.4 [***]
-- Query the employee(s) with the shortest name and the employee(s)
-- with the longest name, together with the length of each name.
--   - If several employees tie for shortest or longest, list all
--     of them.
--   - Order by name length, then alphabetically by name.
--
-- Expected result:
-- +-------------+-------------+
-- | name        | name_length |
-- +-------------+-------------+
-- | Amy         |           3 |
-- | Ian         |           3 |
-- | Bartholomew |          11 |
-- | Christopher |          11 |
-- +-------------+-------------+

-- Your answer here


-- =============================================================
-- Q2: ORDER_HISTORY
-- =============================================================
--   Field          Type
--   -------------  -------------
--   ORDER_ID       int
--   CUSTOMER_NAME  varchar
--   PRODUCT        varchar
--   ORDER_DATE     date
--   AMOUNT         decimal(10,2)   -- total value of the order
--   QUANTITY       int

-- -------------------------------------------------------------
-- Q2.1 [*]
-- Query the total revenue (sum of AMOUNT) from orders placed in
-- March 2021.
--
-- Expected result:
-- +---------------+
-- | total_revenue |
-- +---------------+
-- |       4200.00 |
-- +---------------+

-- Your answer here


-- -------------------------------------------------------------
-- Q2.2 [*]
-- Query every order with an amount greater than $500. Show the
-- customer name and the amount, ordered by amount (highest first),
-- then by customer name (A to Z).
-- A customer with several such orders appears once per order.
--
-- Expected result:
-- +---------------+---------+
-- | customer_name | amount  |
-- +---------------+---------+
-- | Frank         | 2400.00 |
-- | Alice         | 1200.00 |
-- | Grace         |  900.00 |
-- | Alice         |  750.00 |
-- | Henry         |  750.00 |
-- +---------------+---------+

-- Your answer here


-- -------------------------------------------------------------
-- Q2.3 [**]
-- Query the number of orders for each product, ordered by order
-- count (highest first), then by product name (A to Z).
-- Return a single text column in this format:
--     Product [product] has [order_count] orders
--
-- Expected result:
-- +---------------------------------+
-- | summary                         |
-- +---------------------------------+
-- | Product Headphones has 3 orders |
-- | Product Keyboard has 3 orders   |
-- | Product Laptop has 3 orders     |
-- | Product Monitor has 2 orders    |
-- | Product Mouse has 2 orders      |
-- +---------------------------------+

-- Your answer here


-- -------------------------------------------------------------
-- Q2.4 [***]
-- Query the products whose total quantity ordered on a single day
-- is at least 50. Add up all orders of the same product on the same
-- day before comparing with 50.
--   - List each product only once, in alphabetical order.
--
-- Expected result:
-- +----------+
-- | product  |
-- +----------+
-- | Keyboard |
-- | Mouse    |
-- +----------+

-- Your answer here


-- =============================================================
-- Q3: MOVIE_RENTAL
-- =============================================================
--   Field        Type
--   -----------  ------------
--   RENTAL_ID    int
--   MOVIE_TITLE  varchar
--   GENRE        varchar
--   RENTAL_DATE  date
--   PRICE        decimal(8,2)   -- total paid for the rental
--   DAYS_RENTED  int

-- -------------------------------------------------------------
-- Q3.1 [*]
-- Query the total rental revenue (sum of PRICE) for movies in the
-- "Action" genre.
--
-- Expected result:
-- +---------------+
-- | total_revenue |
-- +---------------+
-- |        930.00 |
-- +---------------+

-- Your answer here


-- -------------------------------------------------------------
-- Q3.2 [**]
-- Query the rental dates whose total revenue is greater than $300,
-- with that revenue, ordered from highest to lowest revenue.
--
-- Expected result:
-- +-------------+---------------+
-- | rental_date | total_revenue |
-- +-------------+---------------+
-- | 2022-04-18  |        400.00 |
-- | 2022-03-05  |        380.00 |
-- | 2022-01-15  |        350.00 |
-- +-------------+---------------+

-- Your answer here


-- -------------------------------------------------------------
-- Q3.3 [**]
-- For rentals in 2022 whose movie title contains "star" in any
-- letter case ("Star", "STAR", "superstar" all count), query the
-- number of rentals and their total revenue.
-- Hint: MySQL's default collation already ignores case in LIKE,
-- but many databases do not. Can you write it so it works either
-- way?
--
-- Expected result:
-- +--------------+---------------+
-- | rental_count | total_revenue |
-- +--------------+---------------+
-- |            3 |        300.00 |
-- +--------------+---------------+

-- Your answer here


-- -------------------------------------------------------------
-- Q3.4 [*]
-- Query the movie titles that were rented for more than 7 days in
-- a single rental.
--   - List each title only once, in alphabetical order.
--
-- Expected result:
-- +-------------+
-- | movie_title |
-- +-------------+
-- | Inception   |
-- | John Wick   |
-- | Mad Max     |
-- | Superstar   |
-- +-------------+

-- Your answer here
