
-- 1407. Top Travellers
--Write an SQL query to report the distance traveled by each user.
-- Return the result table ordered by travelled_distance in descending order
-- if two or more users traveled the same distance
-- order them by their name in ascending order.

SELECT
name,
CASE WHEN SUM(distance) IS NULL THEN 0 ELSE SUM(distance) END AS travelled_distance
FROM Users as u
LEFT JOIN Rides as r
ON u.id=r.user_id
GROUP BY 1
ORDER BY 2 DESC,1 ASC