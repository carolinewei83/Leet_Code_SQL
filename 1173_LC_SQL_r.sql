
-- 1148. Article Views I
--Write an SQL query to find all the authors that viewed at least one of their own articles.
--Return the result table sorted by id in ascending order.
--The query result format is in the following example.

--Solution 1. Distinct keyword
SELECT DISTINCT author_id as id
FROM Views
WHERE author_id=viewer_id
ORDER BY 1

-- Solution 2. If order by first, we need another Select and alias
SELECT author_id AS id FROM Views
where author_id = viewer_id
GROUP BY id
ORDER BY id

