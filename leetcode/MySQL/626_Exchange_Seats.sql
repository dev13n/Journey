# Write your MySQL query statement below
WITH cte AS(
SELECT *, CASE WHEN id%2=0 THEN id-1 WHEN id%2=1 AND id<(SELECT MAX(id) FROM Seat) THEN id+1 ELSE id END AS test
FROM Seat
)

SELECT test AS id, student
FROM cte
ORDER BY test
;