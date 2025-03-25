-- JOINS

CREATE TABLE employees (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  department VARCHAR(50) NOT NULL
);

CREATE TABLE salaries (
  id INT PRIMARY KEY,
  employee_id INTEGER NOT NULL,
  salary INTEGER NOT NULL
);

-- Insert Statements

INSERT INTO employees (id,name, department)
VALUES (1,'John Smith', 'Sales'),
       (2,'Jane Doe', 'Marketing'),
       (3,'Bob Brown', 'Sales'),
       (5,'Sarah Anderson', 'Marketing');

INSERT INTO salaries (id,employee_id, salary)
VALUES (1, 1, 50000),
       (2, 2, 60000),
       (3, 3, 70000),
	     (4, 4, 80000);

-- INNER JOIN

SELECT employees.name, salaries.salary
FROM employees
INNER JOIN salaries ON employees.id = salaries.employee_id;

-- LEFT JOIN

SELECT employees.name, salaries.salary
FROM employees
LEFT JOIN salaries ON employees.id = salaries.employee_id;


-- RIGHT JOIN

SELECT employees.name, salaries.salary
FROM employees
RIGHT JOIN salaries ON employees.id = salaries.employee_id;

-- FULL OUTER JOIN

SELECT employees.name, salaries.salary
FROM employees
FULL OUTER JOIN salaries ON employees.id = salaries.employee_id;

-- CROSS JOIN

SELECT employees.name, salaries.salary
FROM employees
CROSS JOIN salaries;

-- Example
-- Table Structures
CREATE TABLE customers (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE orders (
  id INT PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  product VARCHAR(50) NOT NULL,
  quantity INTEGER NOT NULL,
  price DECIMAL(10,2) NOT NULL
);

-- Insert Statements

INSERT INTO customers (id, name, email)
VALUES (1, 'John Smith', 'john@example.com'),
       (2, 'Jane Doe', 'jane@example.com'),
       (3, 'Bob Brown', 'bob@example.com'),
       (4, 'Sarah Anderson', 'sarah@example.com'),
       (5, 'Dan Koe', 'dan@example.com');

INSERT INTO orders (id, customer_id, product, quantity, price)
VALUES (1, 1,'iPhone', 2, 1000),
       (2, 2,'MacBook', 1, 1500),
       (3, 3,'iPad', 1, 800),
       (4, 5,'iMac', 1, 2000);

-- INNER JOIN

SELECT orders.id, customers.name, orders.product, orders.quantity, orders.price
FROM orders
INNER JOIN customers ON orders.customer_id = customers.id;

-- LEFT JOIN

SELECT orders.id, customers.name, orders.product, orders.quantity, orders.price
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.id;

-- RIGHT JOIN

SELECT orders.id, customers.name, orders.product, orders.quantity, orders.price
FROM orders
RIGHT JOIN customers ON orders.customer_id = customers.id;

-- FULL OUTER JOIN

SELECT orders.id, customers.name, orders.product, orders.quantity, orders.price
FROM orders
FULL OUTER JOIN customers ON orders.customer_id = customers.id;

-- SELF JOIN

CREATE TABLE employees001 (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  manager_id INT
);

