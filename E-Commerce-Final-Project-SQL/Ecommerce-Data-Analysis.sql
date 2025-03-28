'''Create a temporary table that joins the orders, order_products, and products 
tables to get information about each order, including the products that were purchased
and their department and aisle information.'''

CREATE TEMPORARY TABLE temp_table as
select o.order_id, o.order_number, o.order_dow, o.order_hour_of_day, o.days_since_prior_order,
           op.product_id, op.add_to_cart_order, op.reordered,
           p.product_name, p.aisle_id, p.department_id 
from orders o
join order_products op on o.order_id = op.order_id
join products p on p.product_id = op.product_id
select * from orders
select * from products
select * from order_products
select * from temp_table

'''Create a temporary table that groups the orders by product and finds the total number
of times each product was purchased, the total number of times each product was reordered,
and the average number of times each product was added to a cart'''


CREATE TEMPORARY TABLE second_temp_table as
select count(*) as total_orders,
	product_id, product_name,
	count(CASE WHEN bool(reordered) = TRUE THEN 1 ELSE NULL end) AS total_reorders,
	avg(add_to_cart_order)as avg_add_to_cart
	from temp_table 
group by product_id,product_name

select * from second_temp_table

'''Create a temporary table that groups the orders by department and finds the total number
of products purchased, the total number of unique products purchased, the total number of
products purchased on weekdays vs weekends, and the average time of day that products in
each department are ordered.'''

CREATE TEMPORARY TABLE department_order_summary AS
    SELECT department_id, COUNT(*) AS total_products_purchased,
           COUNT(DISTINCT product_id) AS total_unique_products_purchased,
           COUNT(CASE WHEN order_dow < 6 THEN 1 ELSE NULL END) AS total_weekday_purchases,
           COUNT(CASE WHEN order_dow >= 6 THEN 1 ELSE NULL END) AS total_weekend_purchases,
           AVG(order_hour_of_day) AS avg_order_time
    FROM temp_table
    GROUP BY department_id

select * from department_order_summary

'''Create a temporary table that groups the orders by aisle and finds the 
top 10 most popular aisles, including the total number of products purchased and
the total number of unique products purchased from each aisle.'''

CREATE TEMPORARY TABLE ai_table AS
 select aisle_id, count(*) as total_products_purchased,
 count(distinct product_id) as total_unique_products_purchased
 from temp_table
 group by aisle_id
 order by count(*) desc
 limit 10
select * from ai_table

''' Combine the information from the previous temporary tables into a final table that
shows the product ID, product name, department ID, department name, aisle ID, aisle name,
total number of times purchased, total number of times reordered, average number of times
added to cart, total number of products purchased, total number of unique products purchased,
total number of products purchased on weekdays, total number of products purchased on
weekends, and average time of day products are ordered in each department.'''

CREATE TEMPORARY TABLE product_behavior_analysis AS
    SELECT pi.product_id, pi.product_name, pi.department_id, d.department, pi.aisle_id, a.aisle,
           pos.total_orders, pos.total_reorders, pos.avg_add_to_cart,
           dos.total_products_purchased, dos.total_unique_products_purchased,
           dos.total_weekday_purchases, dos.total_weekend_purchases, dos.avg_order_time
    FROM second_temp_table AS pos
    JOIN products AS pi ON pos.product_id = pi.product_id
    JOIN departments AS d ON pi.department_id = d.department_id
    JOIN aisles AS a ON pi.aisle_id = a.aisle_id
    JOIN department_order_summary AS dos ON pi.department_id = dos.department_id
select * from product_behavior_analysis



