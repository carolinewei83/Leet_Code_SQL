-- 1501. Countries You Can Safely Invest In
-- A telecommunications company wants to invest in new countries.
-- The company intends to invest in the countries where the average call duration of the calls in this country is strictly greater than the global average call duration.
-- Write an SQL query to find the countries where this company can invest.


SELECT t.name as country
FROM
Person as p
JOIN Country as t
    ON LEFT(p.phone_number,3)=t.country_code
JOIN Calls c
     ON p.id IN (c.caller_id, c.callee_id)
GROUP BY 1
HAVING AVG(duration) > (SELECT AVG(duration) FROM Calls);