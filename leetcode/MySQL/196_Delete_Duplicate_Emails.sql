--  Write your MySQL query statement below
DELETE p2
FROM Person AS p1 
INNER JOIN Person AS p2
WHERE p1.email = p2.email
AND p1.id<p2.id
;