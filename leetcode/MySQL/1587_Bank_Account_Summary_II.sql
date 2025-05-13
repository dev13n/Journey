--  Write your MySQL query statement below
SELECT u.name AS name, SUM(t.amount) AS BALANCE
FROM Transactions AS t
LEFT JOIN Users AS u
ON t.account = u.account
GROUP BY t.account
HAVING BALANCE > 10000
;