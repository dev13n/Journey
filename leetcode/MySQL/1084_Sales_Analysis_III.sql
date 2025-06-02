--  Write your MySQL query statement below
WITH cte AS(
SELECT product_id
FROM Sales
WHERE sale_date < '2019-01-01' OR sale_date > '2019-3-31'
)

SELECT DISTINCT s.product_id, p.product_name
FROM Sales AS s
LEFT JOIN Product AS p
ON s.product_id = p.product_id
WHERE s.product_id NOT IN (SELECT product_id FROM cte)
;