-- Problem: Nth Highest Salary
-- Source: LeetCode #177
-- Link: https://leetcode.com/problems/nth-highest-salary/
-- Difficulty: Medium
-- Language: MS SQL Server
-- Topics: Window functions, DENSE_RANK, Scalar UDF, NULL handling

CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        SELECT DISTINCT salary
        FROM (
            SELECT
                salary,
                DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
            FROM Employee
        ) AS RankedSalaries
        WHERE rnk = @N
    );
END
