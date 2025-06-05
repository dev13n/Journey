--  Write your MySQL query statement below
WITH cte AS(
SELECT t.status AS t_status, t.request_at AS Day, u1.banned AS u_one, u2.banned AS u_two
FROM Trips AS t
LEFT JOIN Users AS u1
ON t.client_id = u1.users_id
LEFT JOIN Users AS u2
ON t.driver_id = u2.users_id
WHERE request_at >= "2013-10-01" AND request_at <= "2013-10-03"
)

SELECT Day, ROUND(SUM(CASE WHEN (t_status="cancelled_by_client" OR t_status="cancelled_by_driver") AND u_one='No' AND u_two='No' THEN 1 ELSE 0 END) / SUM(CASE WHEN u_one='No' AND u_two='No' THEN 1 ELSE 0 END) ,2) AS "Cancellation Rate"

FROM cte
GROUP BY Day
HAVING ROUND(SUM(CASE WHEN (t_status="cancelled_by_client" OR t_status="cancelled_by_driver") AND u_one='No' AND u_two='No' THEN 1 ELSE 0 END) / SUM(CASE WHEN u_one='No' AND u_two='No' THEN 1 ELSE 0 END) ,2) IS NOT null
;