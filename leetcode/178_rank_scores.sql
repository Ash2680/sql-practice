-- Problem: Rank Scores
-- Source: LeetCode #178
-- Link: https://leetcode.com/problems/rank-scores/description/
-- Difficulty: Medium
-- Language: MS SQL Server
-- Topics: Window functions, DENSE_RANK

select 
    score, 
    dense_rank() over (order by score desc) as rank
from scores
