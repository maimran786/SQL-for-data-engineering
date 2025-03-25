-- ORDER BY, GROUP BY, and HAVING Clause

-- Creating the Table and Inserting Data

CREATE TABLE customer_orders (
order_id INT PRIMARY KEY,
customer_name VARCHAR(50),
order_date DATE,
order_amount DECIMAL(10,2)
);

INSERT INTO customer_orders (order_id, customer_name, order_date, order_amount)
VALUES
(1, 'John', '2021-01-01', 100),
(2, 'Jane', '2021-01-02', 200),
(3, 'John', '2021-01-03', 50),
(4, 'Jane', '2021-01-04', 300),
(5, 'John', '2021-01-05', 150);

-- ORDER BY Clause

SELECT * FROM customer_orders
ORDER BY order_amount ASC;

-- IN Descending order

SELECT * FROM customer_orders
ORDER BY order_amount DESC;

-- GROUP BY Clause

SELECT customer_name, SUM(order_amount) AS total_order_amount FROM customer_orders
GROUP BY customer_name;

-- HAVING Clause

SELECT customer_name, SUM(order_amount) AS total_order_amount FROM customer_orders
GROUP BY customer_name
HAVING SUM(order_amount) > 400;

