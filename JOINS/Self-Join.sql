-- Self Join

CREATE TABLE Employee002 (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    emp_manager_id INTEGER
);

--Insert values

INSERT INTO Employee002 (emp_name, emp_manager_id) VALUES
('John', NULL),
('Jane', 1),
('Bob', 2),
('Alice', 2),
('Mike', 3);

-- Self Join

SELECT e1.emp_name, e2.emp_name AS manager_name
FROM Employee002 e1
LEFT JOIN Employee002 e2 ON e1.emp_manager_id = e2.emp_id;

-- Ecommerce Table

CREATE TABLE Ecommerce (
    order_id SERIAL PRIMARY KEY,
    user_id INTEGER,
    product VARCHAR(50)
);

-- Insert Values

INSERT INTO Ecommerce (user_id, product) VALUES
(1, 'Shoes'),
(2, 'T-Shirt'),
(3, 'Jeans'),
(1, 'Socks'),
(2, 'Pants'),
(1, 'Hat');

-- Ecommerce Self Join

SELECT e1.user_id, e1.product, e2.product
FROM Ecommerce e1
LEFT JOIN Ecommerce e2 ON e1.user_id = e2.user_id AND e1.order_id <> e2.order_id;

-- Student Table

CREATE TABLE Student01 (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50),
    student_class VARCHAR(10),
    student_teacher VARCHAR(50)
);

-- Insert Values

INSERT INTO Student01 (student_name, student_class, student_teacher) VALUES
('John', '10A', 'Mr. Smith'),
('Jane', '10B', 'Mrs. Jones'),
('Bob', '10A', 'Mr. Smith'),
('Alice', '10B', 'Mrs. Jones'),
('Mike', '10C', 'Mr. Brown');

-- Student Self Join

SELECT s1.student_name, s2.student_name
FROM Student01 s1
LEFT JOIN Student01 s2 ON s1.student_teacher = s2.student_teacher AND s1.student_id <> s2.student_id;