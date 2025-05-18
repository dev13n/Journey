# Write your MySQL query statement below
(SELECT employee_id
FROM Employees AS e
UNION
SELECT employee_id
FROM Salaries AS s)
EXCEPT
(SELECT employee_id
FROM Employees AS e
INTERSECT
SELECT employee_id
FROM Salaries AS s)
ORDER BY employee_id ASC
;