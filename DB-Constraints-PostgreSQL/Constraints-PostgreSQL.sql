-- Creating a Table with Constraints

CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    employee_name TEXT NOT NULL,
    employee_salary NUMERIC(10, 2) CHECK (employee_salary > 0)
);

-- 1. NOT NULL Constraint

ALTER TABLE employees ALTER COLUMN employee_name SET NOT NULL;

ALTER TABLE employees ALTER COLUMN employee_salary SET NOT NULL;

-- 2. UNIQUE Constraint

-- For Example
CREATE TABLE stud (
    email VARCHAR(50) 
);

INSERT INTO stud(email)
VALUES
	('imran123@gmail.com'),
	('mohammad123@gmail.com'),
	('abdul123@gmail.com');
	
ALTER TABLE stud ADD CONSTRAINT unique_email UNIQUE (email);

-- 3. PRIMARY KEY Constraint

CREATE TABLE orders (
    order_id INTEGER,
    customer_id INTEGER,
    order_date DATE
);

ALTER TABLE orders ADD CONSTRAINT pk_orders PRIMARY KEY (order_id);

-- 4. FOREIGN KEY Constraint

-- For example

ALTER TABLE orders ADD COLUMN email VARCHAR(50);

ALTER TABLE orders 
ADD CONSTRAINT fk_orders_students
FOREIGN KEY (email)
REFERENCES stud (email);

-- 5. CHECK Constraint

-- For Example

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INTEGER
);

ALTER TABLE students ADD CONSTRAINT check_age CHECK (age >= 18);

INSERT INTO students (name, age) VALUES
    ('Imran Khan', 22),
    ('Mohammad Ali', 19),
    ('Abdul Rahman', 25);

SELECT * FROM students
