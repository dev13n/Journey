# Write your MySQL query statement below
SELECT tone.name AS Employee
FROM Employee AS tone
JOIN  Employee AS ttwo 
ON tone.managerID = ttwo.id 
WHERE tone.salary>ttwo.salary;