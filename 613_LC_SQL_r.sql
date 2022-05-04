
-- 613. Shortest Distance in a Line
SELECT MIN(distance) AS shortest FROM
(
SELECT x,
    ABS(x- LEAD(x,1) OVER(ORDER BY x ASC)) AS distance
    FROM point
) x