-- 1050. Actors and Directors Who Cooperated At Least Three Times

-- Write a SQL query for a report that provides the pairs (actor_id, director_id)
-- where the actor has cooperated with the director at least three times.
SELECT actor_id,director_id
FROM ActorDirector
GROUP BY 1,2
HAVING COUNT(*)>2;
