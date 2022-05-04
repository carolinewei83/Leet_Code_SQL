-- 1075. Project Employees I
-- Write an SQL query that reports the average experience years of all the employees
-- for each project, rounded to 2 digits.

SELECT
project_id,
ROUND(AVG(experience_years),2) AS average_years
FROM Project as p
INNER JOIN Employee as e
On p.employee_id=e.employee_id
GROUP BY 1


-- 1076. Project Employees II
-- Write an SQL query that reports all the projects that have the most employees.

SELECT
project_id
FROM Project as p
GROUP BY 1
HAVING COUNT(employee_id)=(
	SELECT COUNT(employee_id) cnt
	FROM Project
	GROUP BY project_id
	ORDER BY cnt DESC
	LIMIT 1);
-- Why do i have to have group by 1 otherwise the output could be null?


SELECT project_id
FROM Project
GROUP BY project_id
HAVING COUNT(employee_id) = (
    SELECT MAX(ec.ct)
    FROM (
        SELECT COUNT(employee_id) as ct
        FROM Project
        GROUP BY project_id
    ) ec
);

