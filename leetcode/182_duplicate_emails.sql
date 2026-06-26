-- Problem: Duplicate Emails
-- Source: LeetCode #182
-- Link: https://leetcode.com/problems/duplicate-emails/description/
-- Difficulty: Easy
-- Language: MS SQL Server
-- Topics: GROUP BY, HAVING, Aggregation

select 
  email
from person
group by email
having count(*) > 1
