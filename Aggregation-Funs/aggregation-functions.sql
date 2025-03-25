-- Aggregation Functions

CREATE TABLE sales01 (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(50),
    sales_date DATE,
    sales_amount NUMERIC(10,2)
);
-- Insert data

INSERT INTO sales01 (product_name, sales_date, sales_amount)
VALUES
    ('Product A', '2022-01-01', 100.50),
    ('Product B', '2022-01-01', 150.25),
    ('Product C', '2022-01-02', 75.00),
    ('Product A', '2022-01-02', 50.75),
    ('Product B', '2022-01-03', 200.00),
    ('Product C', '2022-01-03', 125.50);

--Aggregation Functions

-- COUNT Function

SELECT COUNT(*) AS total_sales FROM sales01;

-- SUM Function

SELECT SUM(sales_amount) AS total_sales_amount FROM sales01;

-- AVG Function

SELECT AVG(sales_amount) AS average_sales_amount FROM sales01;

-- MIN Function

SELECT MIN(sales_amount) AS minimum_sales_amount FROM sales01;

-- MAX Function

SELECT MAX(sales_amount) AS maximum_sales_amount FROM sales01;

-- GROUP BY Clause

SELECT product_name, SUM(sales_amount) AS total_sales_amount
FROM sales01
GROUP BY product_name;

-- HAVING Clause

SELECT product_name, SUM(sales_amount) AS total_sales_amount
FROM sales01
GROUP BY product_name
HAVING SUM(sales_amount) > 200;
