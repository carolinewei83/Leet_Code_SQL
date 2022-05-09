# Write your MySQL query statement below

-- Write an SQL query to find the average daily percentage of posts that got removed
-- after being reported as spam, rounded to 2 decimal places.

SELECT ROUND(AVG(s.daily_percent)*100,2) as average_daily_percent
-- round(sum(percent)/count(distinct action_date),2) as average_daily_percent
FROM
(SELECT COUNT(DISTINCT r.post_id)/COUNT(DISTINCT a.post_id) as daily_percent,
a.action_date
FROM Actions as a
LEFT JOIN removals as r
ON a.post_id=r.post_id
WHERE a.action='report'
AND a.extra='spam'
GROUP BY 2) as s
