--  Write your MySQL query statement below
SELECT Stu.student_id, Stu.student_name, Sub.subject_name, COUNT(Exa.Subject_name) AS attended_exams
FROM Students AS Stu
CROSS JOIN Subjects AS Sub
LEFT JOIN Examinations AS Exa
ON Stu.student_id = Exa.student_id AND Sub.subject_name = Exa.subject_name
GROUP BY Stu.student_id, Stu.student_name, Sub.Subject_name
ORDER BY student_id
;