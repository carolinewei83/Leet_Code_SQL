-- 1113. Reported Posts
-- Write an SQL query that reports the number of posts reported yesterday for each report reason.
-- Assume today is 2019-07-05.


SELECT
extra as report_reason,
COUNT(DISTINCT post_id) as report_count
FROM Actions
WHERE action_date='2019-07-04'
AND action='report'
GROUP BY 1

--No need to filter extra is not null.
--When action = 'report', extra is guaranteed not null.

--No need to filter count > 0.
--If a group exists, it must have at least one row.