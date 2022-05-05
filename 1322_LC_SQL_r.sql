
--1322.Ads Performance
-- Find click through rate
-- Return the result table ordered by ctr in descending order
-- and by ad_id in ascending order in case of a tie.

-- Solution 1.
SELECT
a.ad_id,
ROUND(CASE WHEN SUM(sum_click)/(SUM(sum_click)+SUM(sum_view))*100 IS NULL THEN 0 ELSE SUM(sum_click)/(SUM(sum_click)+SUM(sum_view))*100 END,2) as ctr
FROM Ads as a
LEFT JOIN

(SELECT ad_id,
SUM(CASE WHEN(action='Clicked') THEN 1 ELSE 0 END) AS sum_click,
SUM(CASE WHEN(action='Viewed') THEN 1 ELSE 0 END) AS sum_view
FROM Ads
GROUP BY 1) as s
ON a.ad_id=s.ad_id
GROUP BY 1
ORDER BY 2 DESC, 1 ASC;

-- Solution 2.
SELECT
    ad_id as ad_id,
    IFNULL(ROUND(AVG(100 * (ACTION = 'Clicked') /
        (ACTION <> 'Ignored')), 2), 0) as ctr
FROM Ads
GROUP BY 1
ORDER BY 2 DESC, 1