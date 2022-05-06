-- 1511. Customer Order Frequency
-- Write an SQL query to report the customer_id and customer_name of
-- Customers who have spent at least $100 in each month of June and July 2020.
-- Return the result table in any order.


SELECT c.customer_id,
c.name
FROM Customers as c
JOIN Orders as o
ON c.customer_id=o.customer_id
JOIN Product as p
ON p.product_id=o.product_id
GROUP BY 1
HAVING SUM(CASE WHEN(LEFT(order_date,7)='2020-06') THEN o.quantity ELSE 0 END *p.price)>=100
AND SUM(CASE WHEN(LEFT(order_date,7)='2020-07') THEN o.quantity ELSE 0 END *p.price)>=100;
