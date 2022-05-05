
-- 1421. NPV Queries
-- Write an SQL query to find the npv of each query of the Queries table.
-- Return the result table in any order.

SELECT
q.id,q.year,
CASE WHEN n.npv IS NULL THEN 0 ELSE n.npv END AS npv
FROM NPV as n
RIGHT JOIN Queries as q
ON n.id=q.id AND n.year=q.year