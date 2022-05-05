
-- 1378. Replace Employee ID With The Unique Identifier
-- Write an SQL query to show the unique ID of each user,
-- If a user does not have a unique ID replace just show null.
-- Return the result table in any order.

SELECT
u.unique_id,e.name
FROM Employees as e
LEFT JOIN EmployeeUNI as u
ON e.id=u.id
