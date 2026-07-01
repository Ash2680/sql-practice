-- Problem: Find Followers Count
-- Source: LeetCode #1731
-- Link: https://leetcode.com/problems/find-followers-count/description/
-- Difficulty: Easy
-- Language: MS SQL Server
-- Topics: GROUP BY, Aggregation, COUNT

select 
    user_id,
    count(follower_id) as followers_count
from followers
group by user_id
