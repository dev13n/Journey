--  Write your MySQL query statement below
SELECT p.product_name, o.su AS unit
FROM Products AS p
INNER JOIN
(
SELECT product_id, unit, SUM(unit) AS su
FROM Orders
WHERE MONTH(order_date) = 2 AND YEAR(order_date) = 2020
GROUP BY product_id
HAVING SUM(unit) >= 100
) AS o
ON p.product_id = o.product_id
;