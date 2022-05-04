--1173. Immediate Food Delivery I
-- If customer's preferred delivery date is the same as the order date, then the order is called immediate;
-- Otherwise, it is called scheduled.
-- Write an SQL query to find the percentage of immediate orders in the table
-- Rounded to 2 decimal places.

--Solution 1.
SELECT
ROUND(SUM(imm_flag)/SUM(total)*100,2) AS immediate_percentage
FROM
(SELECT delivery_id,
CASE WHEN(order_date=customer_pref_delivery_date) THEN 1 ELSE 0 END AS imm_flag,
COUNT(1) as total
FROM Delivery
GROUP BY 1) as m;


-- Solution 2.
select round( (a.immediate / b.total) * 100.0, 2) as immediate_percentage from
(select count(*) as immediate from delivery where order_date = customer_pref_delivery_date) as a,
(select count(*) as total from delivery) as b