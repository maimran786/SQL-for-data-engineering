-- Window Function

-- Sample Table

CREATE TABLE sales_window (
  date DATE,
  salesperson VARCHAR(50),
  sales_amount INT
);

-- Insert Values

INSERT INTO sales_window (date, salesperson, sales_amount)
VALUES
  ('2022-01-01', 'Alice', 1000),
  ('2022-01-01', 'Bob', 1500),
  ('2022-01-02', 'Alice', 2000),
  ('2022-01-02', 'Bob', 2500),
  ('2022-01-03', 'Alice', 3000),
  ('2022-01-03', 'Bob', 3500),
  ('2022-01-04', 'Alice', 4000),
  ('2022-01-04', 'Bob', 4500),
  ('2022-01-05', 'Alice', 5000),
  ('2022-01-05', 'Bob', 5500);

-- Ex 1: Calculating Running Totals

SELECT
  date,
  salesperson,
  sales_amount,
  SUM(sales_amount) OVER (PARTITION BY salesperson ORDER BY date) AS running_total
FROM sales_window;

-- Ex 2: Calculating Percentages

SELECT
  date,
  salesperson,
  sales_amount,
  100.0 * sales_amount / SUM(sales_amount) OVER (PARTITION BY date ORDER BY date) AS percentage_total
FROM sales_window;


