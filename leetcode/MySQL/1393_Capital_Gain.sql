--  Write your MySQL query statement below
WITH condn AS(
SELECT stock_name, CASE WHEN operation = 'BUY' THEN price*(-1) ELSE price END AS test
FROM Stocks
)

SELECT stock_name, SUM(test) AS capital_gain_loss
FROM condn
GROUP BY(stock_name)
;