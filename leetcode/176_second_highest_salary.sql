-- Problem: Second Highest Salary
-- Source: LeetCode #176
-- Link: https://leetcode.com/problems/second-highest-salary/
-- Difficulty: Medium
-- Language: MS SQL Server
-- Topics: Window functions, DENSE_RANK, Subqueries, NULL handling
-- Approach 1 (Simple): Filter out the MAX salary then find MAX of remaining. Clean but breaks if you need Nth highest.
-- Approach 2 (Scalable): DENSE_RANK handles ties correctly and generalises to any Nth highest salary easily. Outer SELECT returns NULL naturally if no 2nd salary exists.

-- Approach 1: Subquery with MAX
-- SELECT MAX(salary) AS SecondHighestSalary
-- FROM Employee
-- WHERE salary < (SELECT MAX(salary) FROM Employee);

-- Approach 2: DENSE_RANK (preferred — handles ties, scales to Nth highest) 
SELECT (
    SELECT DISTINCT salary
    FROM (
        SELECT 
            salary,
            DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
        FROM Employee
    ) AS RankedSalaries
    WHERE rnk = 2
) AS SecondHighestSalary;
