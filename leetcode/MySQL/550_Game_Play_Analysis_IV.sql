--  Write your MySQL query statement below
# ROUND (COUNT(DISTINCT a1.player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction

WITH first_logins AS (
    SELECT player_id, MIN(event_date) AS first_login_date
    FROM Activity
    GROUP BY player_id
),
consecutive_logins AS (
    SELECT DISTINCT f.player_id
    FROM first_logins f
    JOIN Activity a
    ON f.player_id = a.player_id
    AND DATEDIFF(a.event_date, f.first_login_date) = 1
)
SELECT ROUND(COUNT(DISTINCT cl.player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM consecutive_logins cl;
