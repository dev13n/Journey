--  Write your MySQL query statement below
WITH cte AS(
SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 2
)

-- SELECT CASE WHEN salary AS SecondHighestSalary
SELECT CASE WHEN (SELECT COUNT(DISTINCT salary) FROM cte) = 2 THEN MIN(salary) ELSE null END AS SecondHighestSalary 
FROM cte
ORDER BY salary
LIMIT 1
;