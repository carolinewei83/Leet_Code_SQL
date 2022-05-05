
-- 1251. Average Selling Price
-- Write an SQL query to find the average selling price for each product.
-- Average_price should be rounded to 2 decimal places.
-- Return the result table in any order.

SELECT p.product_id,
ROUND(SUM(p.price*u.units)/SUM(u.units),2) as average_price
FROM Prices as p
INNER JOIN UnitsSold as u
ON p.product_id=u.product_id
AND u.purchase_date>=p.start_date
AND u.purchase_date<=p.end_date
GROUP BY 1;
