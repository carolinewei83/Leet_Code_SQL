-- 1098. Unpopular Books
-- Write an SQL query that reports the books that have sold less than 10 copies in the last year, excluding  -- books that have been available for less than one month from today. Assume today is 2019-06-23.
-- Return the result table in any order.


SELECT b.book_id,b.name
FROM Books as b
LEFT JOIN Orders as o
ON b.book_id=o.book_id
WHERE b.available_from<"2019-05-23"
AND book_id NOT IN

(SELECT b.book_id,b.name
FROM Books as b
LEFT JOIN Orders as o
ON b.book_id=o.book_id
WHERE b.dispatch_date BETWEEN '2018-05-23' AND '2019-05-23'
HAVING SUM(o.quantity)>10)



-- Some books available_from early than '2019-05-23', but no sales during '2018-06-23' and '2019-06-23'
-- Group BY cannot reflect those book with no sales
-- however, they are book that have less than 10 copies sold.
-- Have to use NOT IN (those books sold more than 10 copies)
-- Instead of IN (those books sold less than 10 copies (0 copy books not included))