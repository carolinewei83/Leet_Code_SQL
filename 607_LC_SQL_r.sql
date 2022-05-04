
-- 607. Sales Person
-- Write an SQL query to report the names of all the salespersons
-- who did not have any orders
-- related to the company with the name "RED".

# Write your MySQL query statement below

SELECT s.name
FROM SalesPerson AS s
WHERE sales_id NOT IN
(SELECT o.sales_id
 FROM Orders AS o
LEFT JOIN Company as c
ON o.com_id=c.com_id
WHERE c.name='RED')