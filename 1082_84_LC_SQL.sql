-- 1082. Sales Analysis I
-- Write an SQL query that reports the best seller by total sales price
-- If there is a tie, report them all.
-- Return the result table in any order.

-- Solution 1.
SELECT seller_id FROM sales
GROUP BY seller_id
HAVING SUM(price)=
(SELECT
SUM(price) AS total_price
FROM sales
GROUP BY seller_id
ORDER BY total_price DESC LIMIT 1);


-- Solution 2
WITH CTE AS (
    SELECT seller_id, SUM(price) AS price_sum
    FROM Sales
    GROUP BY seller_id)
SELECT
    seller_id
FROM
    CTE
WHERE
    price_sum = (SELECT MAX(price_sum) FROM CTE)



-- 1083. Sales Analysis II
-- Write an SQL query that reports the buyers who have bought S8 but not iPhone.
-- Note that S8 and iPhone are products present in the Product table.

-- Mistake - cannot just do where statement because
-- We don't want customer who bought both S8 and Iphone, we want just S8 buyers
-- Solution 1.
SELECT buyer_id
FROM sales AS s
INNER JOIN product AS p
ON s.product_id=p.product_id
GROUP BY buyer_id
HAVING SUM(p.product_name = 'S8') > 0
AND SUM(p.product_name = 'iPhone') = 0;

-- Solution 2. Less Efficient
WITH CTE AS
(SELECT buyer_id,product_name FROM
sales AS s
INNER JOIN product AS p
ON s.product_id=p.product_id
GROUP BY buyer_id,product_name)

SELECT buyer_id FROM
CTE
WHERE product_name = 'S8'
AND buyer_id NOT IN (SELECT buyer_id FROM
                    CTE
                    where product_name = 'iPhone')


-- 1084. Sales Analysis III
-- Write an SQL query that reports the products that were only sold in the spring of 2019.
-- That is, between 2019-01-01 and 2019-03-31 inclusive.
-- If the product is sold in any other time frame it should not show up


-- Potential Solutions
--product has no any sales
--product sold in the spring of 2019 only
--product sold in other periods, but not in the spring of 2019
--product sold in the spring of 2019 and in other periods
--The 2nd case only is correct for the task condition
--(only sold in the spring of 2019, between 2019-01-01 and 2019-03-31 inclusive)

-- Solution 1.
SELECT s.product_id,product_name
FROM sales AS s
INNER JOIN product AS p
ON s.product_id=p.product_id
WHERE s.sale_date BETWEEN '2019-01-01' AND '2019-03-31'
AND s.product_id NOT IN
(SELECT product_id
FROM sales
WHERE sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31')
GROUP BY 1,2;

-- Solution 2.
SELECT product_id, product_name
FROM Sales
JOIN Product
Using(product_id)
GROUP BY product_id
HAVING MIN(sale_date) >= '2019-01-01'
AND MAX(sale_date) <= '2019-03-31'







