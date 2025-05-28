--  Write your MySQL query statement below
WITH cte AS(
SELECT *, COUNT(user_id) AS rate_no
FROM MovieRating AS mr
GROUP BY user_id
),

cte2 AS(
SELECT *, AVG(rating) AS avg
FROM MovieRating
WHERE MONTH(created_at) = 02 AND YEAR(created_at) = 2020
GROUP BY movie_id
),

cte3 AS(
SELECT name AS results
FROM cte
LEFT JOIN Users 
ON cte.user_id = Users.user_id
ORDER BY rate_no DESC, name ASC
LIMIT 1
),

cte4 AS (
SELECT title AS results
FROM cte2
LEFT JOIN Movies
ON cte2.movie_id = Movies.movie_id
ORDER BY avg DESC, title ASC
LIMIT 1
)

SELECT results
FROM cte3
UNION ALL
SELECT results
FROM cte4
;