
-- 610. Triangle Judgement
SELECT x, y, z,
       CASE
            WHEN y+z>x AND x+z>y AND x+y>z THEN 'Yes'
            ELSE 'No'
            END AS triangle
FROM triangle