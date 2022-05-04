-- 586. Customer Placing the Largest Number of Orders

-- Write an SQL query to find the customer_number for the customer
-- who has placed the largest number of orders.
SELECT
 customer_number
FROM Orders
GROUP BY 1
ORDER BY COUNT(1) DESC
LIMIT 1;

-- Follow Up More than 1 customers
SELECT
 customer_number
FROM Orders
HAVING COUNT(order_number)== (
	SELECT COUNT(order_number) cnt
	FROM orders
	GROUP BY customer_number
	ORDER BY cnt DESC
	LIMIT 1);

