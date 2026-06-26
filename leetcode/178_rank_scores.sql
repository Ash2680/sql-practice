-- Problem: Rank Scores
-- Source: LeetCode #178
-- Link: https://leetcode.com/problems/rank-scores/description/
-- Difficulty: Medium
-- Language: MS SQL Server
-- Topics: Window functions, DENSE_RANK

SELECT
    score,
    DENSE_RANK() OVER (ORDER BY score DESC) AS [rank]
FROM Scores;
