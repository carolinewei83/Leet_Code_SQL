-- 534. Game Play Analysis III
-- Write an SQL query to report for each player and date, how many games played so far by the player.
-- That is, the total number of games played by the player until that date.
-- Return the result table in any order.

-- Solution 1. Window Function
SELECT player_id,event_date,
SUM(games_played) OVER (PARTITION BY player_id ORDER BY event_date ASC) AS games_played_so_far
FROM activity
ORDER BY 1,3


-- Solution 2. Self Join
SELECT a1.player_id, a1.event_date,
SUM(a2.games_played) AS games_played_so_far
FROM activity a1, activity a2
WHERE a1.player_id = a2.player_id
AND a1.event_date >=a2.event_date
GROUP BY a1.player_id, a1.event_date
ORDER BY a1.player_id, a1.event_date;
