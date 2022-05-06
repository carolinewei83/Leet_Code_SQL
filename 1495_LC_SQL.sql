-- 1495. Friendly Movies Streamed Last Month
-- Write an SQL query to report the distinct titles of the kid-friendly
-- movies streamed in June 2020.
-- Return the result table in any order.


SELECT DISTINCT c.title

FROM Content as c
JOIN TVProgram as t
ON c.content_id=t.content_id
WHERE c.content_type='Movies'
AND c.Kids_content='Y'
AND YEAR(program_date)=2020
AND MONTH(program_date)=6