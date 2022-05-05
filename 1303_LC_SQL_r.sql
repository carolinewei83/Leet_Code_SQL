
-- 1303. Find the Team Size
-- Write an SQL query to find the team size of each of the employees.
-- Return result table in any order.

-- Solution 1. Left Join
SELECT e.employee_id,
MAX(m.team_size) as team_size
FROM Employee  as e
LEFT JOIN

(SELECT
 COUNT(1) as team_size,
 team_id
FROM Employee
GROUP BY 2) AS m
ON e.team_id=m.team_id
GROUP BY 1;

--Solution 2. Window Function
SELECT employee_id,
COUNT(*) OVER (PARTITION BY team_id) as team_size
FROM Employee


-- Solution 3. Self Join
SELECT e.employee_id,
(SELECT COUNT(team_id) FROM Employee
 WHERE e.team_id = team_id) as team_size
FROM Employee e