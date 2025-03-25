-- Data Exploration with SELECT

-- Create the Sales Table

CREATE TABLE sales (
  id INT,
  sale_date DATE,
  product VARCHAR(50),
  quantity INT,
  revenue DECIMAL(10,2)
);

-- Insert Data into the Sales Table

INSERT INTO sales (id, sale_date, product, quantity, revenue)
VALUES
  (1, '2021-01-01', 'Product A', 10, 100.00),
  (2, '2021-01-02', 'Product B', 5, 50.00),
  (3, '2021-01-03', 'Product C', 15, 150.00),
  (4, '2021-01-04', 'Product A', 8, 80.00),
  (5, '2021-01-05', 'Product B', 12, 120.00),
  (6, '2021-01-06', 'Product C', 20, 200.00),
  (7, '2021-01-07', 'Product A', 6, 60.00),
  (8, '2021-01-08', 'Product B', 18, 180.00),
  (9, '2021-01-09', 'Product C', 10, 100.00),
  (10, '2021-01-10', 'Product A', 4, 40.00);


SELECT * FROM sales;

-- Retrieve data only for a specific product, such as "Product A"

SELECT * FROM sales WHERE product = 'Product A';

-- Retrieve the total revenue for each day

SELECT date, SUM(revenue) FROM sales GROUP BY date;

-- Retrieve the total revenue for each product

SELECT product, SUM(revenue) FROM sales GROUP BY product;

-- Retrieve the top-selling products in descending order by quantity sold

SELECT product, SUM(quantity) FROM sales GROUP BY product ORDER BY SUM(quantity) DESC;

