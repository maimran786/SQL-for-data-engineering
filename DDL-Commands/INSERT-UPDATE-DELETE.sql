-- DDL(INSERT, UPDATE, and DELETE queries)

-- Creating Sample Table Structure

CREATE TABLE emp (
    id SERIAL PRIMARY KEY,
    name TEXT,
    age INTEGER,
    salary NUMERIC
);

-- INSERT Query

-- syntax
-- INSERT INTO table_name (column1, column2, column3, ...)
-- VALUES (value1, value2, value3, ...);

-- example
INSERT INTO emp (name, age, salary)
VALUES ('John Doe', 30, 50000);

-- UPDATE Query

-- syntax
-- UPDATE table_name
-- SET column1 = value1, column2 = value2, ...
-- WHERE condition;

-- example
UPDATE emp
SET salary = 60000
WHERE name = 'John Doe';

-- DELETE Query

-- syntax
-- DELETE FROM table_name
-- WHERE condition;

-- example
DELETE FROM employees
WHERE name = 'John Doe';

