
-- 1280. Students and Examinations
--Write an SQL query to find the number of times each student attended each exam.
--Return the result table ordered by student_id and subject_name.
--The query result format is in the following example.

SELECT
s.student_id,s.student_name,b.subject_name,
CASE WHEN(COUNT(e.subject_name) IS NULL) THEN 0 ELSE COUNT(e.subject_name) END  as attended_exams
FROM Students as s
CROSS JOIN Subjects as b
LEFT JOIN Examinations as e
ON s.student_id=e.student_id
AND b.subject_name=e.subject_name
GROUP BY s.student_id,b.subject_name
ORDER BY s.student_id,b.subject_name