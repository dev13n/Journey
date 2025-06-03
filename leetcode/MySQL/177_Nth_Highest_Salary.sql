CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      WITH cte AS(
      SELECT *, DENSE_RANK() OVER(ORDER BY SALARY DESC) AS drank
      FROM Employee
      )
      SELECT DISTINCT IFNULL(salary, NULL)
      FROM cte
      WHERE drank = N

  );
END