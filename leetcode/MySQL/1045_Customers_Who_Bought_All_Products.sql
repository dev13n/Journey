--  Write your MySQL query statement below
SELECT customer_id
FROM
(SELECT *, COUNT(DISTINCT product_key) - (SELECT COUNT(product_key) FROM Product) AS t
FROM Customer
GROUP BY customer_id
) AS te
WHERE t=0
;