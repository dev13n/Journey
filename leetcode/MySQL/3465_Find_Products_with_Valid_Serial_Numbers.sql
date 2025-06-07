--  Write your MySQL query statement below
SELECT *
FROM Products
WHERE description REGEXP '\\bSN[0-9]{4}\-[0-9]{4}([^0-9]+|$)'
ORDER BY product_id
;