--  Write your MySQL query statement below
SELECT a1.machine_id, CASE WHEN a1.timestamp < a2.timestamp THEN ROUND(AVG(a2.timestamp-a1.timestamp),3) ELSE NULL END AS processing_time
FROM Activity AS a1
INNER JOIN Activity AS a2
WHERE a1.machine_id = a2.machine_id
AND a1.process_id = a2.process_id
AND a1.timestamp < a2.timestamp
GROUP BY a1.machine_id
;