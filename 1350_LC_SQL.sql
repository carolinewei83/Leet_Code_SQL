
-- 1350. Students With Invalid Departments


SELECT id, name
FROM Students
WHERE department_id NOT IN (SELECT id from Departments)