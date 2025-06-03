--  Write your MySQL query statement below
WITH cte AS(
SELECT e.name AS Employee, e.salary, d.name AS department, MAX(e.salary) OVER(PARTITION BY e.departmentId) AS max_salary
FROM Employee AS e
LEFT JOIN Department AS d
ON e.departmentId = d.id
)

SELECT department, employee, salary
FROM cte
WHERE salary = max_salary
;