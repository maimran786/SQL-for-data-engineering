-- Subqueries

-- SELECT column_name(s)
-- FROM table_name
-- WHERE column_name operator (SELECT column_name FROM table_name WHERE condition);

-- Example

CREATE TABLE customers01 (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    customer_email VARCHAR(50) NOT NULL
);

CREATE TABLE orders01 (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    order_amount DECIMAL(10,2) NOT NULL
);

INSERT INTO customers01 (customer_name, customer_email) VALUES
    ('John Doe', 'johndoe@example.com'),
    ('Jane Smith', 'janesmith@example.com'),
    ('Bob Johnson', 'bobjohnson@example.com');

INSERT INTO orders01 (customer_id, order_date, order_amount) VALUES
    (1, '2021-01-01', 50.00),
    (1, '2021-02-01', 75.00),
    (2, '2021-02-15', 125.00),
    (3, '2021-03-01', 200.00);

-- subquery
SELECT customer_name
FROM customers01
WHERE customer_id IN (SELECT customer_id FROM orders01 WHERE order_amount > 100);

-- Multiple Subqueries in SELECT Statement

SELECT customer_name, customer_email,
(SELECT COUNT(*) FROM orders01 o WHERE o.customer_id = ct.customer_id) as total_orders,
(SELECT SUM(order_amount) FROM orders01 o WHERE o.customer_id = ct.customer_id) as total_order_amount
FROM customers01 ct;

-- Subquery in FROM Statement

SELECT customer_name, AVG(order_amount) as avg_order_amount
FROM (
    SELECT *
    FROM customers01
    INNER JOIN orders01 ON customers01.customer_id = orders01.customer_id
) AS cust_orders
GROUP BY customer_name;

-- Subquery in HAVING Statement

SELECT customer_name, COUNT(*) as total_orders
FROM customers01
INNER JOIN orders01 ON customers01.customer_id = orders01.customer_id
GROUP BY customer_name
HAVING COUNT(*) > 1;




