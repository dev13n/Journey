--  Write your MySQL query statement below
WITH cte AS(
    SELECT *, SUM(weight) OVER(ORDER BY turn ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS t
    FROM Queue
)
SELECT person_name
FROM cte
WHERE t<=1000
ORDER BY t DESC
LIMIT 1
;