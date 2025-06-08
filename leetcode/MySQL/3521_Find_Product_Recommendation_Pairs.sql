# Write your MySQL query statement below
WITH cte AS (
SELECT p1.product_id AS product1_id, p2.product_id AS product2_id, COUNT(DISTINCT p1.user_id) AS customer_count
FROM ProductPurchases AS p1
LEFT JOIN ProductPurchases AS p2
ON p1.product_id < p2.product_id AND p1.user_id = p2.user_id
GROUP BY p1.product_id, p2.product_id
HAVING COUNT(DISTINCT p1.user_id) >= 3 AND p1.product_id IS NOT NULL AND p2.product_id IS NOT NULL
ORDER BY COUNT(DISTINCT p1.user_id) DESC, p1.product_id ASC, p2.product_id ASC
)

SELECT c.product1_id, c.product2_id, pi1.category AS product1_category, pi2.category AS product2_category, c.customer_count
FROM cte AS c
LEFT JOIN ProductInfo AS pi1 
ON c.product1_id = pi1.product_id
LEFT JOIN ProductInfo AS pi2 
ON c.product2_id = pi2.product_id
ORDER BY c.customer_count DESC, c.product1_id ASC, c.product2_id ASC
;