--  Write your MySQL query statement below
SELECT class #,COUNT(class)
FROM Courses
GROUP BY class
HAVING COUNT(class) >= 5;