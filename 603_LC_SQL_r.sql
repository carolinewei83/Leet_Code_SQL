
-- 603. Consecutive Available Seats
-- The key concept to test for this question is 
-- 1. The use of window function lead/lag 
-- 2. The expected output is the consecutive seat number, hence the where statement needs an OR()

SELECT
  c.seat_id
FROM (
   SELECT
     seat_id,
     free,

     -- get value of 'free' of the record '1' offset ahead with default value 'false' instead of null
     LEAD(free, 1, FALSE) OVER () AS next_free,
     
     -- get value of 'free' of the record '1' offset before with default value 'false' instead of null
     LAG(free, 1, FALSE) OVER () AS  prev_free
   FROM cinema
) c
WHERE c.free AND (next_free OR prev_free)
ORDER BY c.seat_id
