-- Problem: Article Views I
-- Source: LeetCode #1148
-- Link: https://leetcode.com/problems/article-views-i/description/
-- Difficulty: Easy
-- Language: MS SQL Server
-- Topics: Filtering, DISTINCT, WHERE

select distinct
    author_id as id
from views 
where author_id = viewer_id
order by author_id
