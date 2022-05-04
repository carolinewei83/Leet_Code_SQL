-- 1068. Product Sales Analysis I

-- Write an SQL query that reports the
-- product_name, year, and price for each sale_id in the Sales table.

SELECT p.product_name,
s.year,s.price
FROM Sales as s
INNER JOIN Product as p
ON s.product_id=p.product_id;

--(sale_id, year) is the primary key of this table.
--product_id is a foreign key to Product table.
-- Initially wanted to use left join due to the above statement, in this case inner join also does the trick