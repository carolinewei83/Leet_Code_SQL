-- 511. Game Play Analysis I
--Write an SQL query to report the first login date for each player.
--Return the result table in any order.

SELECT player_id,
MIN(event_date) as first_login
FROM Activity
GROUP BY 1

--512. Game Play Analysis II
--Write an SQL query to report the device that is first logged in for each player.
--Return the result table in any order.

-- Solution 1.
SELECT a.player_id,device_id
FROM Activity AS a
INNER JOIN
(SELECT player_id,
MIN(event_date) as first_login
FROM Activity
GROUP BY 1) AS c
ON a.event_date=c.first_login AND a.player_id=c.player_id
GROUP BY 1,2

-- Solution 2
SELECT player_id, device_id
FROM Activity
WHERE (player_id,event_date) IN (SELECT player_id, MIN(event_date)
FROM Activity
GROUP BY player_id)