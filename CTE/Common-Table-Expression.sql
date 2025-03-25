-- Common Table Expression (CTE)

-- WITH my_cte AS (
--    SELECT column1, column2
--    FROM my_table
--    WHERE column3 = 'value'
-- )
-- SELECT * FROM my_cte;

--Example

CREATE TABLE employees03 (
   id SERIAL PRIMARY KEY,
   name VARCHAR(255) NOT NULL,
   salary INTEGER NOT NULL
);

INSERT INTO employees03 (name, salary) VALUES
   ('John Doe', 45000),
   ('Jane Smith', 55000),
   ('Bob Johnson', 65000),
   ('Alice Lee', 75000);

WITH high_salary_employees AS (
   SELECT name, salary
   FROM employees03
   WHERE salary >= 50000
)
SELECT * FROM high_salary_employees;

-- Example 2: Filtering Data

CREATE TABLE books (
   id SERIAL PRIMARY KEY,
   title VARCHAR(255) NOT NULL,
   author VARCHAR(255) NOT NULL,
   published_year INTEGER NOT NULL
);

INSERT INTO books (title, author, published_year) VALUES
   ('The Catcher in the Rye', 'J.D. Salinger', 1951),
   ('To Kill a Mockingbird', 'Harper Lee', 1960),
   ('1984', 'George Orwell', 1949),
   ('The Great Gatsby', 'F. Scott Fitzgerald', 1925),
   ('The Lord of the Rings', 'J.R.R. Tolkien', 1954),
   ('The Da Vinci Code', 'Dan Brown', 2003);

WITH new_books AS (
   SELECT title, author, published_year
   FROM books
   WHERE published_year > 2000
)
SELECT * FROM new_books;

-- Example 3: Joining Tables

CREATE TABLE departments01 (
   id SERIAL PRIMARY KEY,
   name VARCHAR(255) NOT NULL
);

INSERT INTO departments (name) VALUES
   ('Sales'),
   ('Marketing'),
   ('IT');

CREATE TABLE employees04 (
   id SERIAL PRIMARY KEY,
   name VARCHAR(255) NOT NULL,
   department_id INTEGER NOT NULL
);

INSERT INTO employees04 (name, department_id) VALUES
   ('John Doe', 1),
   ('Jane Smith', 2),
   ('Bob Johnson', 1),
   ('Alice Lee', 3);

WITH employee_departments AS (
   SELECT employees04.name, departments.name AS department_name
   FROM employees04
   JOIN departments ON employees04.department_id = departments.id
)
SELECT * FROM employee_departments;

-- Example 4: Multiple SELECT CTE

CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  price INTEGER NOT NULL
);

CREATE TABLE sales02 (
  id SERIAL PRIMARY KEY,
  item_id INTEGER NOT NULL,
  quantity INTEGER NOT NULL,
  sale_date DATE NOT NULL
);

INSERT INTO items (name, price) VALUES
  ('Product A', 100),
  ('Product B', 200),
  ('Product C', 300);

INSERT INTO sales02 (item_id, quantity, sale_date) VALUES
  (1, 10, '2022-01-01'),
  (2, 5, '2022-01-01'),
  (3, 2, '2022-01-01'),
  (1, 20, '2022-02-01'),
  (2, 10, '2022-02-01'),
  (3, 4, '2022-02-01'),
  (1, 30, '2022-03-01'),
  (2, 15, '2022-03-01'),
  (3, 6, '2022-03-01');

WITH monthly_sales AS (
  SELECT
    DATE_TRUNC('month', sale_date) AS month,
    SUM(quantity) AS total_quantity,
    SUM(quantity * price) AS total_revenue
  FROM sales02
  JOIN items ON sales02.item_id = items.id
  GROUP BY month
),
monthly_items_sold AS (
  SELECT
    DATE_TRUNC('month', sale_date) AS month,
    SUM(quantity) AS total_items_sold
  FROM sales02
  GROUP BY month
)
SELECT
  monthly_sales.month,
  monthly_items_sold.total_items_sold,
  monthly_sales.total_revenue
FROM monthly_sales
JOIN monthly_items_sold ON monthly_sales.month = monthly_items_sold.month;

