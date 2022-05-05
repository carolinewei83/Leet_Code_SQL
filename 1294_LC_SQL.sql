
-- 1294. Weather Type in Each Country
-- Write an SQL query to find the type of weather in each country for November 2019.
-- The type of weather is:
-- Cold if the average weather_state is less than or equal 15,
-- Hot if the average weather_state is greater than or equal to 25, and
-- Warm otherwise. Return result table in any order.

SELECT
c.country_name,
CASE WHEN AVG(weather_state)<=15 THEN 'Cold'
     WHEN AVG(weather_state)>=25 THEN 'Hot'
     ELSE 'Warm' END
     AS weather_type
FROM Countries as c
JOIN Weather as w
ON c.country_id=w.country_id
WHERE YEAR(w.day)=2019 AND MONTH(w.day)=11
GROUP BY 1;