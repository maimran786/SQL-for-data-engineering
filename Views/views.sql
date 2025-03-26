-- Views

CREATE TABLE customers_view (
    customer_id INT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
);

CREATE TABLE orders_view (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    item TEXT,
    quantity INT,
    price NUMERIC(10,2)
);

-- Insert values into the table

INSERT INTO customers_view (customer_id, first_name, last_name)
VALUES (101, 'John', 'Doe');

INSERT INTO orders_view (order_id, customer_id, order_date, item, quantity, price)
VALUES (1, 101, '2022-01-01', 'Shoes', 2, 50);

-- query that joins the tables and defines the view

CREATE VIEW customer_orders_view AS
SELECT customers_view.customer_id, first_name, last_name, order_date, item, quantity, price
FROM customers_view
JOIN orders_view ON customers_view.customer_id = orders_view.customer_id;

SELECT * FROM customer_orders_view;