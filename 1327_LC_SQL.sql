
--1327. List the Products Ordered in a Period
-- Write an SQL query to get the names of products that have at least 100
-- units ordered in February 2020 and their amount.
-- Return result table in any order.


SELECT
p.product_name,
SUM(o.unit) as unit
FROM Orders as o
LEFT JOIN Products as p
ON o.product_id=p.product_id
WHERE YEAR(order_date)=2020
AND MONTH(order_date)=2
GROUP BY 1
HAVING SUM(o.unit) >=100;