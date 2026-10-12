-- =============================================================
-- 1D-SQL-Demo-MySQL.sql   (MySQL 8)
-- =============================================================
-- Demo for the "Stored Procedures and Triggers" part of
-- 1D-SQL-Part2.pdf: a stored procedure with IN / OUT parameters,
-- a stored procedure that returns a result set, and an AFTER INSERT
-- trigger that writes to a log table.
--
-- The same demo for PostgreSQL is in 1D-SQL-Demo-PostgreSQL.sql.
-- Compare the two to see how the syntax differs.
--
-- Run the file from top to bottom: later sections depend on the
-- tables created earlier. The whole file can be re-run safely.
--
-- About DELIMITER: a procedure or trigger body contains several
-- statements ending in ";". DELIMITER $$ tells the MySQL client to
-- treat "$$" as the end of the whole CREATE statement instead, and
-- DELIMITER ; switches it back. DELIMITER is a client command
-- (MySQL Workbench, mysql CLI), not SQL, so some other tools do not
-- need it.
-- =============================================================


-- =============================================================
-- SETUP
-- =============================================================
CREATE DATABASE IF NOT EXISTS de_1d_demo;
USE de_1d_demo;

DROP TABLE IF EXISTS scores;
CREATE TABLE scores (
    id            INT AUTO_INCREMENT PRIMARY KEY,
    student_name  VARCHAR(50),
    score         INT
);

INSERT INTO scores (student_name, score) VALUES
('Aiden', 80),
('Aiden', 90),
('Aiden', 70),
('Bella', 88),
('Bella', 92),
('Chris', 75);


-- =============================================================
-- Stored Procedure with IN and OUT parameters
-- =============================================================
-- AverageScore takes a student name (IN) and writes that student's
-- average score into an output variable (OUT). SELECT ... INTO
-- stores the query result in the OUT parameter instead of
-- returning it as a result set.
DROP PROCEDURE IF EXISTS AverageScore;

DELIMITER $$

CREATE PROCEDURE AverageScore(
    IN  p_student_name VARCHAR(50),
    OUT p_avg_score    DECIMAL(5,2)
)
BEGIN
    SELECT AVG(score)
    INTO p_avg_score
    FROM scores
    WHERE student_name = p_student_name;
END$$

DELIMITER ;

-- Look at the data first: Aiden has three scores (80, 90, 70).
--
-- Expected result:
-- +----+--------------+-------+
-- | id | student_name | score |
-- +----+--------------+-------+
-- |  1 | Aiden        |    80 |
-- |  2 | Aiden        |    90 |
-- |  3 | Aiden        |    70 |
-- |  4 | Bella        |    88 |
-- |  5 | Bella        |    92 |
-- |  6 | Chris        |    75 |
-- +----+--------------+-------+
SELECT * FROM scores;

-- Call the procedure. @average is a session (user-defined)
-- variable: it receives the OUT value and keeps it until the
-- connection closes. Setting it to 0 first is optional; it only
-- makes the variable's starting value explicit.
SET @average = 0;
CALL AverageScore('Aiden', @average);

-- Read the OUT value: (80 + 90 + 70) / 3 = 80, stored as
-- DECIMAL(5,2).
--
-- Expected result:
-- +----------+
-- | @average |
-- +----------+
-- |    80.00 |
-- +----------+
SELECT @average;


-- =============================================================
-- Trigger: AFTER INSERT writes to a log table
-- =============================================================
-- Drop both tables so the demo can be re-run from scratch.
-- Dropping accounts also drops the trigger defined on it.
DROP TABLE IF EXISTS accounts_log;
DROP TABLE IF EXISTS accounts;

CREATE TABLE accounts (
    account_id    INT AUTO_INCREMENT PRIMARY KEY,
    account_name  VARCHAR(50),
    credit        DECIMAL(10,2)
);

CREATE TABLE accounts_log (
    log_id        INT AUTO_INCREMENT PRIMARY KEY,
    account_name  VARCHAR(50),
    credit        DECIMAL(10,2),
    action_time   DATETIME
);

-- These five rows are inserted BEFORE the trigger exists, so they
-- will not appear in accounts_log.
INSERT INTO accounts (account_name, credit) VALUES
('Account A', 1000.00),
('Account B', 2500.00),
('Account C', 4000.00),
('Account D', 1500.00),
('Account E', 2000.00);

-- The trigger runs once for every row inserted into accounts
-- (FOR EACH ROW). Inside the body, NEW refers to the row that was
-- just inserted.
DROP TRIGGER IF EXISTS trig_after_insert_accounts;

DELIMITER $$

CREATE TRIGGER trig_after_insert_accounts
AFTER INSERT ON accounts
FOR EACH ROW
BEGIN
    INSERT INTO accounts_log (account_name, credit, action_time)
    VALUES (NEW.account_name, NEW.credit, NOW());
END$$

DELIMITER ;


-- =============================================================
-- Stored Procedure that returns a result set
-- =============================================================
-- A procedure does not need OUT parameters: a plain SELECT inside
-- it is returned to the caller as a result set.
DROP PROCEDURE IF EXISTS ShowAccounts;

DELIMITER $$

CREATE PROCEDURE ShowAccounts()
BEGIN
    SELECT * FROM accounts;
END$$

DELIMITER ;


-- =============================================================
-- Fire the trigger
-- =============================================================
-- One INSERT statement with two rows: the trigger fires twice,
-- once per row.
INSERT INTO accounts (account_name, credit) VALUES
('Account F', 5000.00),
('Account G', 3500.00);

-- All seven accounts are in the table.
--
-- Expected result:
-- +------------+--------------+---------+
-- | account_id | account_name | credit  |
-- +------------+--------------+---------+
-- |          1 | Account A    | 1000.00 |
-- |          2 | Account B    | 2500.00 |
-- |          3 | Account C    | 4000.00 |
-- |          4 | Account D    | 1500.00 |
-- |          5 | Account E    | 2000.00 |
-- |          6 | Account F    | 5000.00 |
-- |          7 | Account G    | 3500.00 |
-- +------------+--------------+---------+
SELECT * FROM accounts;

-- The procedure returns the same seven rows as the query above.
CALL ShowAccounts();

-- Only F and G were logged: A to E were inserted before the
-- trigger was created. action_time is the time you ran the INSERT.
--
-- Expected result:
-- +--------+--------------+---------+---------------------+
-- | log_id | account_name | credit  | action_time         |
-- +--------+--------------+---------+---------------------+
-- |      1 | Account F    | 5000.00 | (current date/time) |
-- |      2 | Account G    | 3500.00 | (current date/time) |
-- +--------+--------------+---------+---------------------+
SELECT * FROM accounts_log;
