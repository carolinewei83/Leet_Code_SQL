-- 1321. Restaurant Growth
-- Write an SQL query to compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.
-- Return result table ordered by visited_on in ascending order.
-- The query result format is in the following example.
SELECT DISTINCT  visited_on, amount, round(amount/7, 2) as average_amount
FROM (SELECT visited_on,
      SUM(amount) OVER (ORDER BY
                        visited_on RANGE BETWEEN
                        INTERVAL 6 DAY PRECEEDING AND CURRENT ROW) as amount,
      DENSE_RANK() OVER (ORDER BY visited_on) as rk
      from Customer) as t
WHERE rk >= 7;