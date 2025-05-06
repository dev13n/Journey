--  Write your MySQL query statement below
-- This condition or NULL 

WITH cond AS (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
    ORDER BY num DESC
    LIMIT 1
)

SELECT CASE WHEN COUNT(num)>0 THEN num ELSE NULL END AS num
FROM cond;