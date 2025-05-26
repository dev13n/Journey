--  Write your MySQL query statement below
WITH cte AS(
SELECT *, SUM(amount) AS total_amount
FROM Customer
GROUP BY visited_on
)

SELECT visited_on,
SUM(total_amount) OVER(ORDER BY visited_on ASC RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW) AS amount, 
ROUND(AVG(total_amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount
FROM cte
LIMIT 18446744073709551615 OFFSET 6
;